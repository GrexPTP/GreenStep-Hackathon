<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    public function register_users(){
        return $this->belongsToMany(User::class, 'user_event', 'user_id', 'event_id');
    }

    public function creator(){
        return $this->belongsTo(User::class, 'user_id');
    }
}
