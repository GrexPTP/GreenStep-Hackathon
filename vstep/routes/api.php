<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

use App\Event;
use App\User;
use App\Company;
use App\Step;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

Route::get('/login', function(Request $request){
    $user = User::where('email',$request->email)->first();
    if ($user) {
        if (Hash::check($request->password, $user->password))
        {
            return json_encode($user);
        }
    }
    return null;
});

Route::get('/home',function(Request $request){
    $all = Event::all()->where('status','started');
    $newest = $all->sortByDesc('start_date')->take(5)->toArray();
    $feature = $all->sortByDesc(function($fea){
        return $fea->register_users()->count();
    })->take(5)->toArray();
    return json_encode(array('newest' => array_values($newest),'feature' => array_values($feature)));
});

Route::get('/event/{id}', function(Request $request, $id){
    $event = Event::leftJoin('companies','events.company_id','=','companies.id')->select('companies.name as company_name', 'events.*')->find($id);
    $event->joined = $event->belongsToMany('App\User','user_event','user_id','event_id')->where('id',$request->userID)->count() != 0;
    return json_encode($event);
});

Route::get('/user/{id}', function($id){
    return json_encode(User::find($id));
});

Route::get('/events',function(Request $request){
    return json_encode(array_values(Event::leftJoin('companies','company_id','=','companies.id')->select('companies.name as company_name', 'events.*')->get()->toArray()));
});

Route::get('/my-events/{id}', function($id){
    return json_encode(User::find($id)->hasMany('App\Event','user_id')->leftJoin('companies','company_id','=','companies.id')->select('companies.name as company_name', 'events.*')->get());
});

Route::get('/join-events/{id}', function($id){
    return json_encode(User::find($id)->belongsToMany('App\Event','user_event','event_id','user_id')->leftJoin('companies','company_id','=','companies.id')->select('companies.name as company_name', 'events.*')->get());
});

Route::get('/join-events/{user_id}/{event_id}', function($user_id,$event_id){
    return json_encode(Event::find($event_id)->belongsToMany('App\User','user_event','user_id','event_id')->where('id',$user_id)->count() != 0);
});

Route::get('/event/create/{id}', function(Request $request, $id){
    $event = new Event;
    $event->name = $request->name;
    $event->location = $request->location;
    $event->description = $request->description;
    $event->type = $request->type;
    $event->start_date = $request->start_date;
    $event->start_time = $request->start_time;
    $event->end_date = $request->end_date;
    $event->end_time = $request->end_time;
    $event->distance = $request->distance;
    $event->step_amount = $request->step_amount;
    $event->user_id = $id;
    $event->company_id = $request->company_id;
    $event->save();
    return json_encode($event);
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/finish_race',function(Request $request){
    $user_id = $request->user_id;
    $event_id = $request->event_id;
    $start_long = $request->startLong;
    $start_lat = $request->startLat;
    $end_long = $request->endLong ?? 105.834160;
    $end_lat = $request->endLat ?? 21.027763;
    $result = distance($start_lat,$start_long,$end_lat,$end_long,"K");
    return json_encode(array('result'=>$result < 0.001));
});

Route::get('/participate',function(Request $request){
    $user_id = $request->user_id;
    $event_id = $request->event_id;
    DB::table('user_event')->insert([
        ['user_id' => $user_id,
        'event_id' => $event_id,]
    ]);

    return json_encode(array('result' => true));
});

Route::get('/finish_step', function(Request $request){
    $step = new Step;
    $step->user_id = $request->user_id;
    $step->event_id = $request->event_id;
    $step->total_steps = $request->total_steps;
    $step->finish_time = Carbon::now();
    $step->save();
    return json_encode(array('finish_time' => $step->finish_time->format('h:i:s')));
});

function distance($lat1, $lon1, $lat2, $lon2, $unit) {
    if (($lat1 == $lat2) && ($lon1 == $lon2)) {
      return 0;
    }
    else {
      $theta = $lon1 - $lon2;
      $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
      $dist = acos($dist);
      $dist = rad2deg($dist);
      $miles = $dist * 60 * 1.1515;
      $unit = strtoupper($unit);

      if ($unit == "K") {
        return ($miles * 1.609344);
      } else if ($unit == "N") {
        return ($miles * 0.8684);
      } else {
        return $miles;
      }
    }
  }
