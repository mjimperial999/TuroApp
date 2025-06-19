<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LongQuizzes;
use App\Models\AssessmentResult;
use App\Models\LongQuizAssessmentResult;
use App\Models\LongQuizQuestions;
use App\Models\LongQuizOptions;
use App\Models\StudentProgress;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;

class LongQuizController extends Controller
{
    public function computeStudentAnalytics($studentId)
    {
    // Short quiz data (with module_id)
    $short = AssessmentResult::where('student_id', $studentId)->where('is_kept', 1);
    
    // Long quiz data (no module_id)
    $long = LongQuizAssessmentResult::where('student_id', $studentId)->where('is_kept', 1)
        ->select('score_percentage', 'earned_points');

    // Averages
    $shortAvg = $short->avg('score_percentage');
    $longAvg = $long->avg('score_percentage');

    $shortEarned = $short->sum('earned_points');
    $longEarned = $long->sum('earned_points');

    $shortCount = $short->count();
    $longCount = $long->count();

    $combinedTotal = $short->sum('score_percentage') + $long->sum('score_percentage');
    $combinedCount = $shortCount + $longCount;
    $combinedAvg = $combinedCount > 0 ? $combinedTotal / $combinedCount : 0;

    $totalPoints = ($shortEarned + $longEarned) * 10;

    StudentProgress::updateOrCreate(
        ['student_id' => $studentId],
        [
            'average_score' => $combinedAvg,
            'score_percentage' => $combinedAvg,
            'total_points' => $totalPoints,
        ]
    );
}

    public function startQuiz($courseID, $longQuizID)
    {
        $longquiz = LongQuizzes::findOrFail($longQuizID);

        $questions = $longquiz->longquizquestions->shuffle()->take($longquiz->number_of_questions)->values();
        Session::put("lq_{$longQuizID}_questions", $questions->pluck('long_quiz_question_id')->toArray());

        // Start timer (store deadline in session)
        $timeLimit = $longquiz->time_limit;
        Session::put("lq_{$longQuizID}_started_at", Carbon::now('Asia/Manila'));
        $deadline = Carbon::now('Asia/Manila')->addSeconds($timeLimit);
        Session::put("lq_{$longQuizID}_deadline", $deadline);
        Session::put("lq_{$longQuizID}_in_progress", true);

        return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}/s/q/0");
    }

    public function showQuestion($courseID, $longQuizID, $index)
    {
        $studentID = session('user_id');
        $longquiz = LongQuizzes::findOrFail($longQuizID);
        $questionIDs = Session::get("lq_{$longQuizID}_questions");
        $deadline = Session::get("lq_{$longQuizID}_deadline");


        // Get number of attempts the student has taken
        $currentAttempts = LongQuizAssessmentResult::where('student_id', $studentID)
            ->where('long_quiz_id', $longQuizID)
            ->count();

        // Get the max number of allowed attempts for the quiz
        $maxAttempts = $longquiz->number_of_attempts;
        if ($currentAttempts >= $maxAttempts) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'You have reached the maximum number of quiz attempts.');
        }


        if (!Session::get("lq_{$longQuizID}_in_progress")) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'Quiz has already ended or you accessed an invalid link.');
        }

        // 🔒 Protection: No session = Not taking quiz
        if (!$questionIDs || !$deadline) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'You must start the quiz first.');
        }

        // 🔒 Protection: Time already expired
        if (Carbon::now('Asia/Manila')->gt(Carbon::parse($deadline))) {
            Session::forget("lq_{$longQuizID}_questions");
            Session::forget("lq_{$longQuizID}_answers");
            Session::forget("lq_{$longQuizID}_deadline");

            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'Your quiz session has expired.');
        }

        // 🔒 Protection: Invalid index (out of bounds)
        if (!isset($questionIDs[$index])) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'Invalid question number.');
        }

        $questionID = $questionIDs[$index];
        $question = LongQuizQuestions::with(['longquizoptions', 'longquizimage'])->findOrFail($questionID);
        $remainingSeconds = (int) max(0, Carbon::now('Asia/Manila')->diffInSeconds(Carbon::parse($deadline), false));

        return response()->view('long-quiz-interface', [
            'course' => $courseID,
            'longquiz' => $longquiz,
            'question' => $question,
            'index' => $index,
            'total' => count($questionIDs),
            'remainingSeconds' => $remainingSeconds,
        ]);
    }

    public function submitAnswer(Request $request, $courseID, $longQuizID, $index)
    {
        $selectedOption = $request->input('answer');
        $answers = session()->get("lq_{$longQuizID}_answers", []);
        $answers[$index] = $selectedOption;
        session()->put("lq_{$longQuizID}_answers", $answers);

        $questionIDs = session("lq_{$longQuizID}_questions");
        $nextIndex = $index + 1;

        $deadline = session("lq_{$longQuizID}_deadline");
        $isAutoSubmit = $request->input('auto_submit') == 1;

        if ($isAutoSubmit || Carbon::now('Asia/Manila')->gt(Carbon::parse($deadline))) {
            $nextIndex = count($questionIDs); // force finish quiz
        }

        if (!$questionIDs || !$deadline) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}")
                ->with('error', 'Invalid quiz session.');
        }

        if ($nextIndex < count($questionIDs)) {
            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}/s/q/{$nextIndex}");
        } else {
            $correct = 0;
            foreach ($answers as $i => $selectedOptionID) {
                $questionID = $questionIDs[$i] ?? null;
                if (!$questionID) continue;
                $correctOptionID = LongQuizOptions::where('long_quiz_question_id', $questionID)->where('is_correct', 1)->value('long_quiz_option_id');
                if ($selectedOptionID == $correctOptionID) $correct++;
            }

            $scorePercentage = round(($correct / count($questionIDs)) * 100);
            $earnedPoints = $correct;
            $studentID = session('user_id');

            $prevAttempts = LongQuizAssessmentResult::where('course_id', $courseID)->where('student_id', $studentID)->where('long_quiz_id', $longQuizID)->count();

            LongQuizAssessmentResult::create([
                'result_id' => uniqid(),
                'student_id' => $studentID,
                'course_id' => $courseID,
                'long_quiz_id' => $longQuizID,
                'score_percentage' => $scorePercentage,
                'date_taken' => Carbon::now('Asia/Manila'),
                'attempt_number' => $prevAttempts + 1,
                'earned_points' => $earnedPoints,
                'is_kept' => 0,
            ]);

            LongQuizAssessmentResult::where('student_id', $studentID)->where('long_quiz_id', $longQuizID)->update(['is_kept' => 0]);
            LongQuizAssessmentResult::where('student_id', $studentID)->where('long_quiz_id', $longQuizID)->orderByDesc('score_percentage')->first()->update(['is_kept' => 1]);

            Session::forget("lq_{$longQuizID}_questions");
            Session::forget("lq_{$longQuizID}_answers");
            Session::forget("lq_{$longQuizID}_deadline");
            Session::forget("lq_{$longQuizID}_in_progress");

            $this->computeStudentAnalytics($studentID);

            return redirect("/home-tutor/long-quiz/{$courseID}/{$longQuizID}/summary")
                ->with('success', 'Quiz has been submitted.');
        }
    }
}
