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
}
