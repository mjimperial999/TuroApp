<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\LoginController;

// FOR TESING - GET ROUTES
Route::get('/', function () {
    return redirect('/login');
});

Route::get('/health', function () {
    return response()->json(['status' => 'OK']);
});

Route::get('/login', [LoginController::class, 'showLoginPage'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::get('/logout', [LoginController::class, 'logout']);

Route::get('/home-screening', function () {
    return view('home-screening');
});

Route::get('/module', function () {
    return view('explore-module');
});

Route::get('/subjects', function () {
    return view('subjects');
});

Route::get('/dashboard-math', function () {
    return view('dashboard-math');
});

Route::get('/masterlist', [MainController::class, 'masterlistPage']);

Route::get('/home-tutor', [MainController::class, 'courseList']);
Route::get('/home-tutor/course/{course}', [MainController::class, 'moduleList']);
Route::get('/home-tutor/module/{module}', [MainController::class, 'activityList']);
Route::get('/home-tutor/lecture/{lecture}', [MainController::class, 'lecturePage']);
Route::get('/home-tutor/tutorial/{tutorial}', [MainController::class, 'tutorialPage']);
Route::get('/home-tutor/quiz/{quiz}', [MainController::class, 'quizPage']);

Route::get('/home-tutor/quiz/{activity}/s', [QuizController::class, 'startQuiz']);
Route::get('/home-tutor/quiz/{activity}/s/q/{index}', [QuizController::class, 'showQuestion']);

Route::post('/home-tutor/quiz/{activity}/s/q/{index}', [QuizController::class, 'submitAnswer']);