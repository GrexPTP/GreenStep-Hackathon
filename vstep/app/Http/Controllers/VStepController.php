<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\Step;
use Auth;
use App\User;
class VStepController extends Controller

{
    public function index(){
        //        pending, started, eneded
        $events = Event::where('status', 'pending')->orWhere('status', 'started')->get();
        $events_pasts = Event::where('status', 'ended')->get();
        $my_account = User::find(Auth::id());
        return view('vstep.welcome', compact('events', 'events_pasts', 'my_account'));
    }

    public function challenge($id){
        $event = Event::find($id);
        $register_users = $event->register_users()->get();
        foreach ($register_users as $user)
        {
            $userSteps = Step::where('event_id', $event->id)->where('user_id', $user->id)->get();
            $total_steps = array_sum(array_column(json_decode(json_encode($userSteps), true), 'total_steps'));
            $user->total_step = $total_steps;
        }
        $register_users = $register_users->sortBy('total_steps');
        return view('vstep.challenge', compact('event', 'register_users'));
    }

    public function register($id){
        $user_id = Auth::id();
        $even_id = $id;
        $user = User::find($user_id);
        $event = Event::findOrFail($even_id);
        if ($event->hasUser($user)){
            return $this->challenge($even_id);
        }
        $user->events()->attach($user->id);
        return $this->challenge($even_id);

    }

    public function create(){
        return view('vstep.create-challenge');
    }
}
