<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use DB;
class User extends \TCG\Voyager\Models\User
{
    use Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','birthdate'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function events(){
        return $this->belongsToMany(Event::class, 'user_event', 'user_id', 'event_id');
    }

    public function points(){
        return $this->hasMany(Point::class);
    }

    public function ranking(){
        $ranking = DB::select("select user_id, total,CASE WHEN @l=total THEN @r ELSE @r:=@r+1 END as rank,@l:=total FROM (select user_id, sum(point) as total from points group by user_id order by total desc) totals, (SELECT @r:=0, @l:=NULL) rank");
        return $ranking;
    }

    public function getCurrentRank(){
        $user_id = $this->id;
        $current  = array_filter($this->ranking(), function($objects) use ($user_id){
            return $objects->user_id===$user_id;
        });
        return (int)array_values($current) ? (int)array_values($current)[0]->rank : 'Unrank';
    }

    public function challengeRank($id){
        $user_id = $this->id;
        $rank = Point::where('user_id', $user_id)->where('event_id', $id)->first()->rank;
        return $rank;
    }

    public function highestRank(){
        $rank = 9999;
        $points = Point::where('user_id', $this->id)->get();
        foreach ($points as $point){
            if ($rank !=0 && $point['rank']<$rank){
                $rank = $point['rank'];
            }
        }
        return $rank;
    }

    public function getPoint(){
        $points = $this->points;
        return array_sum(array_column(json_decode(json_encode($points), true), 'point'));
    }
}
