<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use App\Models\Users;

class LoginController extends Controller
{
    public function showLoginPage()
    {
        return view('login');
    }

    public function login(Request $request)
    {
        $user = Users::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password_hash)) {
            if ($user->role_id != 1) {
                return redirect('/login')->with('error', 'Only students can login.');
            }

            Session::put('user_id', $user->user_id);
            Session::put('user_name', $user->first_name . ' ' . $user->last_name);
            Session::put('role_id', $user->role_id);

            return redirect()->intended('/home-tutor');
        }

        return redirect('/login')->with('error', 'Invalid credentials');
    }

    public function logout()
    {
        Session::flush();
        return redirect('/login')->with('error', 'You are logged out.');
    }
}
