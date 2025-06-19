<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\LongQuizController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AdminController;

// GENERAL
Route::get('/', [MainController::class, 'landingRedirect']);

Route::get('/health', function () {
    return response()->json(['status' => 'OK']);
});

Route::get('/login', [LoginController::class, 'showLoginPage']);
Route::post('/auth', [LoginController::class, 'login']);
Route::get('/logout', [LoginController::class, 'logout']);

// ADMIN 
Route::get('/admin-login', [AdminController::class, 'showLoginPage']);

Route::get('/admin-panel', [AdminController::class, 'showLoginPage']);

Route::get('/dashboard-math', function () {
    return view('dashboard-math');
});


// STUDENT
Route::get('/home-screening', function () {
    return view('home-screening');
});

Route::get('/profile', [MainController::class, 'profilePage']);
Route::get('/performance', [MainController::class, 'performancePage']);

Route::get('/home-tutor', [MainController::class, 'courseList']);
Route::get('/home-tutor/course/{course}', [MainController::class, 'moduleList']);
Route::get('/home-tutor/module/{module}', [MainController::class, 'activityList']);
Route::get('/home-tutor/lecture/{lecture}', [MainController::class, 'lecturePage']);
Route::get('/home-tutor/tutorial/{tutorial}', [MainController::class, 'tutorialPage']);

Route::get('/home-tutor/quiz/{quiz}', [MainController::class, 'quizPage']);
Route::get('/home-tutor/quiz/{activity}/s', [QuizController::class, 'startQuiz']);
Route::get('/home-tutor/quiz/{activity}/s/q/{index}', [QuizController::class, 'showQuestion']);
Route::post('/home-tutor/quiz/{activity}/s/q/{index}', [QuizController::class, 'submitAnswer']);
Route::get('/home-tutor/quiz/{activity}/summary', [MainController::class, 'summary']);

Route::get('/home-tutor/long-quiz/{course}/{longquiz}', [MainController::class, 'longquizPage']);
Route::get('/home-tutor/long-quiz/{course}/{longquiz}/s', [LongQuizController::class, 'startQuiz']);
Route::get('/home-tutor/long-quiz/{course}/{longquiz}/s/q/{index}', [LongQuizController::class, 'showQuestion']);
Route::post('/home-tutor/long-quiz/{course}/{longquiz}/s/q/{index}', [LongQuizController::class, 'submitAnswer']);
Route::get('/home-tutor/long-quiz/{course}/{longquiz}/summary', [MainController::class, 'longquizSummary']);

// TEACHER

Route::get('/teachers-panel', [MainController::class, 'teacherPanel']);