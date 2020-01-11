<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\Step;
class VStepController extends Controller

{
    public function index(){
        //        pending, started, eneded
        $events = Event::where('status', 'pending')->orWhere('status', 'started')->get();
        $events_pasts = Event::where('status', 'ended')->get();
        return view('vstep.welcome', compact('events', 'events_pasts'));
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
}
