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

Route::get('/event/{id}', function($id){
    return json_encode(Event::leftJoin('companies','events.company_id','=','companies.id')->select('companies.name as company_name', 'events.*')->find($id));
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
