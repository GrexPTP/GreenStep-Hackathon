<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Point;
class Event extends Model
{
    public function register_users(){
        return $this->belongsToMany(User::class, 'user_event', 'event_id', 'user_id');
    }

    public function users(){
        return $this->belongsToMany(User::class, 'user_event', 'event_id', 'user_id');
    }

    public function creator(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function hasUser($user) {
        return $this->users()->get()->contains($user);
    }

    public function addPoint(){
        $registered_users = $this->register_users();
        foreach ($registered_users->get() as $user)
        {
            $userSteps = Step::where('event_id', $this->id)->where('user_id', $user->id)->get();
            $total_steps = array_sum(array_column(json_decode(json_encode($userSteps), true), 'total_steps'));
            $user->total_step = $total_steps;
        }
        $registered_users = $registered_users->get()->sortBy('total_step',  SORT_REGULAR,  true)->values();
        if ($registered_users->count()<=5){
            $i = $registered_users->count();
            foreach ($registered_users as $key => $user){
                $point = $i*10;
                Point::insert(
                    [
                        'point' => $point,
                        'user_id' => $user->id,
                        'event_id' => $this->id,
                        'rank'     => $key+1
                    ]
                );
                $i--;
            }
        }

    }
}
