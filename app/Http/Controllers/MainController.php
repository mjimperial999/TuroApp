<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Courses;
use App\Models\Modules;
use App\Models\Activities;
use App\Models\AssessmentResult;


class MainController extends Controller
{
    public function masterlistPage()
    {
        $users = Users::all();
        return view('admin.masterlist-page', compact('users'));
    }

    public function courseList()
    {
        if (!session()->has('user_id')) {
            return redirect('/login');
        }

        $courses = Courses::all();
        return view('home-tutor', compact('courses'));
    }


    public function moduleList($courseID)
    {
        if (!session()->has('user_id')) {
            return redirect('/login')->with('error', 'You must be logged in');
        }

        $course = Courses::with('modules')->findOrFail($courseID);
        return view('module-menu', compact('course'));
    }

    public function activityList($moduleID)
    {
        if (!session()->has('user_id')) {
            return redirect('/login')->with('error', 'You must be logged in');
        }
        $module = Modules::with('activities.quiz')->findOrFail($moduleID);
        return view('explore-module', compact('module'));
    }

    public function lecturePage($activityID)
    {
        if (!session()->has('user_id')) {
            return redirect('/login')->with('error', 'You must be logged in');
        }
        $activity = Activities::with('lecture')->findOrFail($activityID);
        return view('activity-lecture', compact('activity'));
    }

    public function tutorialPage($activityID)
    {
        if (!session()->has('user_id')) {
            return redirect('/login')->with('error', 'You must be logged in');
        }
        $activity = Activities::with('tutorial')->findOrFail($activityID);
        return view('activity-tutorial', compact('activity'));
    }

    public function quizPage($activityID)
    {
        if (!session()->has('user_id')) {
            return redirect('/login')->with('error', 'You must be logged in');
        }

        $activity = Activities::with('quiz')->findOrFail($activityID);
        $userID = session('user_id');

        $assessment = AssessmentResult::where('student_id', $userID)
            ->where('activity_id', $activityID)
            ->orderByDesc('is_kept')
            ->first();

        $attempts = AssessmentResult::where('student_id', $userID)
            ->where('activity_id', $activityID)
            ->count();

        $assessDisplay = AssessmentResult::where('student_id', $userID)
            ->where('activity_id', $activityID)
            ->orderBy('date_taken', 'asc')
            ->get();

        return view('activity-quiz', compact('activity', 'assessment', 'attempts', 'assessDisplay'));
    }
}
