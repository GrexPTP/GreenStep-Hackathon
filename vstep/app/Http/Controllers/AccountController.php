<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use Auth;
use App\User;
class AccountController extends Controller
{
    public function challenges(){
        $user_id = Auth::id();
        $my_challenges = Event::where('user_id', $user_id)->get();
        $joined_challenges = User::find($user_id)->events;
        return view('account.challenges',compact('my_challenges', 'joined_challenges'));
    }

    public function common(){
        $user_id = Auth::id();
        $my_challenges = Event::where('user_id', $user_id)->get();
        $joined_challenges = User::find($user_id)->events;
        return view('account.common',compact('my_challenges', 'joined_challenges'));
    }

    public function info(){
        $user = User::find(Auth::id());
        return view('account.info', compact('user'));
    }

    public function postInfo(Request $request){
        if ($request->password=='')
        {
            User::find(Auth::id())->update($request->except(['current_pass', 'password', 're_password', '_csrf']));
        } else {
            User::find(Auth::id())->update($request->except(['_csrf']));
        }
        $user = User::find(Auth::id());
        return view('account.info', compact('user'));
    }

    public function register(Request $request){
        return view('account.register');
    }

    public function postRegister(Request $request){

            User::find(Auth::id())->update($request->except(['password', 're_password', '_csrf']));

        $user = User::find(Auth::id());
        return view('account.register');
    }

}
