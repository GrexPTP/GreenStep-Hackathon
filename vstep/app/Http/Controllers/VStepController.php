<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\Step;
use Auth;
use Carbon\Carbon;
use App\User;
use App\Point;
use DB;
class VStepController extends Controller

{
    public function index(){
        $me = User::find(Auth::id());
        $ranking = DB::select("select user_id, total,CASE WHEN @l=total THEN @r ELSE @r:=@r+1 END as rank,@l:=total FROM (select user_id, sum(point) as total from points group by user_id order by total desc) totals, (SELECT @r:=0, @l:=NULL) rank");
        foreach ($ranking as $key => $rank){
            $challenges = Point::where('user_id', $rank->user_id)->get();
            $rank->challenges = count(array_unique(array_column(json_decode(json_encode($challenges), true), 'event_id')));

        }
        //        pending, started, eneded
        $events = Event::where('status', 'pending')->orWhere('status', 'started')->get();
        $events_pasts = Event::where('status', 'ended')->get()->sortByDesc('created_at');
        $my_account = User::find(Auth::id());
        return view('vstep.welcome', compact('events', 'events_pasts', 'my_account', 'ranking'));
    }

    public function challenge($id){
        $event = Event::find($id);
        $register_users = $event->users()->get();

        $event_start_date = $event->start_date;
        $event_start_time = $event->start_time;
        $event_end_date = $event->end_date;
        $event_end_time = $event->end_time;
        $start_time_str = $event_start_date." ".$event_start_time;
        $end_time_str = $event_end_date." ".$event_end_time;
        $start_date = Carbon::parse($start_time_str);
        $end_date = Carbon::parse($end_time_str);
        $now = Carbon::now();
        $diff_start = $now>=$start_date;
        $diff_end = $now>=$end_date;
        if($diff_end==true){
            if ($event->status=="started"){
                $event->status="ended";
                $event->addPoint();
                $event->save();
            }
        }
        foreach ($register_users as $user)
        {
            $userSteps = Step::where('event_id', $event->id)->where('user_id', $user->id)->get();
            $total_steps = array_sum(array_column(json_decode(json_encode($userSteps), true), 'total_steps'));
            $user->total_step = $total_steps;
        }
        $register_users = $register_users->sortBy('total_step',  SORT_REGULAR,  true)->values();
        $my_account = User::find(Auth::id());
        return view('vstep.challenge', compact('event', 'register_users', 'my_account'));
    }

    public function challenge_marathon($id){
        $event = Event::find($id);
        $register_users = $event->users()->get();
        $event_start_date = $event->start_date;
        $event_start_time = $event->start_time;
        $event_end_date = $event->end_date;
        $event_end_time = $event->end_time;
        $start_time_str = $event_start_date." ".$event_start_time;
        $end_time_str = $event_end_date." ".$event_end_time;
        $start_date = Carbon::parse($start_time_str);
        $end_date = Carbon::parse($end_time_str);
        $now = Carbon::now();
        $diff_start = $now>=$start_date;
        $diff_end = $now>=$end_date;

        if($diff_end==true){
            if ($event->status=="started"){
                $event->status="ended";
                $event->addPoint();
                $event->save();
            }
        }

        foreach ($register_users as $user)
        {
            $userSteps = Step::where('event_id', $event->id)->where('user_id', $user->id)->get();
            $user->finish_time = $userSteps->finish_time;
        }
        $register_users = $register_users->sortBy('finish_time')->values();
        $my_account = User::find(Auth::id());
        return view('vstep.challenge', compact('event', 'register_users', 'my_account'));
    }

    public function register($id){
        $user_id = Auth::id();
        $even_id = $id;
        $user = User::find($user_id);
        $event = Event::findOrFail($even_id);
        if ($event->hasUser($user)){
            return $this->challenge($even_id);
        }
        return view('vstep.confirm-challenge', compact('event', 'user'));


    }

    public function postRegister($id){
        $user_id = Auth::id();
        $even_id = $id;
        $user = User::find($user_id);
        $event = Event::findOrFail($even_id);
        if ($event->hasUser($user)){
            return $this->challenge($even_id);
        }
        $event->users()->attach($user->id);
        return $this->challenge($even_id);
    }

    public function create(){
        return view('vstep.create-challenge');
    }

    public function postCreate(Request $request) {
        $ev = new Event();
        $ev->name = $request->challenge_name;
        $ev->type = $request->type;
        $ev->step_amount = $request->step_amount;
        $ev->distance = $request->distance;
        $ev->start_date = $request->start_date;
        $ev->start_time = $request->start_time;
        $ev->end_date = $request->end_date;
        $ev->end_time = $request->end_time;
        $ev->description = $request->description;
        $ev->user_id = Auth::id();
        $ev->save();
        return redirect()->route('home');
    }
}
