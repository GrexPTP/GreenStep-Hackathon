@extends('master.master')
@section('content')
    <div class="challenge-title">
        <h4>{{ $event->name }}  </h4>

    </div>
    <!-- Page Features -->
    <div class="row text-center">
        <div class="col-lg-12 col-md-12 mb-12">
            @php
                $event_start_date = $event->start_date;
                $event_start_time = $event->start_time;
                $event_end_date = $event->end_date;
                $event_end_time = $event->end_time;
                $start_time_str = $event_start_date." ".$event_start_time;
                $end_time_str = $event_end_date." ".$event_end_time;
                $start_date = Carbon\Carbon::parse($start_time_str);
                $end_date = Carbon\Carbon::parse($end_time_str);
                $now = Carbon\Carbon::now();
                $diff_start = $now>=$start_date;
                $diff = $now >= $end_date;

            @endphp
            @if ($register_users->count()>0)
                @if ($diff==true)
                    <div class="text-center">Challenge is over, <span class="first-color">{{ $register_users->first()->name }}</span> is winner !</div>
                @endif
            @endif
            @if ($diff_start)
                <div class="text-right">@if($diff==true)<span style="border-radius: 2px; border: 1px solid black;"><b> End </b>: {{ $end_date }} </span>@else <b>Time remaining <span id="timer"></span> @endif </b></div>
            @else
                @if(!$event->hasUser($my_account))
                    <div class="text-right" style="margin-bottom: 10px"><a class="btn btn-sm btn-primary"  href="{{ route('challenge.register', $event->id) }}">Register Now</a></div>
                @endif
                <div class="card-header bg-success text-white d-flex" >
                    <a href="#" class="text-white"><i class="fa-th"></i><b>Start: </b>{{ $start_date }}</a>
                    <a href="#" class="text-white ml-auto"><b>End:</b>: {{ $end_date }}</a>
                </div>
            @endif
            <table class="table table-bordered">
                <thead class="thead">
                <tr>
                    <th scope="col" style="width: 10%">Rank</th>
                    <th scope="col" style="width: 20%">User</th>
                    <th scope="col" style="width: 60%">Target: Run {{ $event->distance  }}</th>
{{--                    <th scope="col" style="width: 10%">Longest</th>--}}
                </tr>
                </thead>
                <tbody>

                @foreach ($register_users as $key => $user)
                    @php
                        $user_step = $user->total_step;
                        $target_step = $event->distance;
                        $result = $user->finish_time != null;
                        if ($key==0){
                            $titleColor = "first-color";
                        } elseif ($key==1){
                            $titleColor = "second-color";
                        } elseif ($key==2){
                            $titleColor = "third-color";
                        } else {
                            $titleColor ="";
                        }
                    @endphp
                    <tr>
                        <th scope="row">{{ $key+1 }}</th>
                        <td class="{{ $titleColor }}">{{ $user['name'] }}</td>
                        <td>
                            <div class="position-relative">
                                {{ $result ? 'Finish at '.Carbon\Carbon::parse($user->finish_time)->format('h:i:s') : 'Not Finished'}}</h5>
                            </div>
                        </td>
{{--                        <td>700</td>--}}
                    </tr>
                @endforeach
                </tbody>
            </table>

        </div>
    </div>
    <!-- /.row -->

    <br>
    <br>
    @if ($event->status !=='ended')
        <script type="text/javascript">
            function autoRefreshPage()
            {
                window.location = window.location.href;
            }
            setInterval('autoRefreshPage()', 10000);
        </script>

    <script>
        var countDownDate = new Date("{{ $end_date }}").getTime();
        var x = setInterval(function() {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var hours = Math.floor(distance / (1000 * 60 * 60 * 24)*24 + (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            document.getElementById("timer").innerHTML =  hours + ":"
                + minutes + ":" + seconds;
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("timer").innerHTML = "ENDED";
            }
        }, 1000);
    </script>
    @endif
@endsection
