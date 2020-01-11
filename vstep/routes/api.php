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
Route::get('/home',function(Request $request){
    $all = Event::all()->where('status','started');
    $newest = $all->sortByDesc('start_date')->take(5)->toArray();
    $feature = $all->sortByDesc(function($fea){
        return $fea->register_users()->count();
    })->take(5)->toArray();
    return json_encode(array('newest' => array_values($newest),'feature' => array_values($feature)));
});

Route::get('/event/{id}', function($id){
    return json_encode(Event::find($id));
});

Route::get('/user/{id}', function($id){
    return json_encode(User::find($id));
});

Route::get('/events',function(Request $request){
    return json_encode(array_values(Event::all()->toArray()));
});

Route::get('/my-events/{id}', function($id){
    return User::find($id)->belongsToMany('App\Event','user_event','event_id','user_id')->get();
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
