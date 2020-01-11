<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
class VStepController extends Controller

{
    public function index(){
        //        pending, started, eneded
        $events = Event::where('status', 'pending')->orWhere('status', 'started')->get();
        return view('vstep.welcome', compact('events'));
    }
}
