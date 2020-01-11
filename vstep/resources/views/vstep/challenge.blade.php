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
                $end_date = Carbon\Carbon::parse($end_time_str);
                $now = Carbon\Carbon::now();
                $diff = $now>$end_date;

            @endphp
            @if ($diff==true)
                <div class="text-center">Challenge is over, <span class="first-color">{{ $register_users->first()->name }}</span> is winner !</div>
            @endif

            <div class="text-right">@if($diff==true)<span style="border-radius: 2px; border: 1px solid black;"><b> End </b>: {{ $end_date }} </span>@else <b>Time remaining <span id="timer"></span> @endif </b></div>

            <table class="table table-bordered">
                <thead class="thead">
                <tr>
                    <th scope="col" style="width: 10%">Rank</th>
                    <th scope="col" style="width: 20%">User</th>
                    <th scope="col" style="width: 60%">Progress ({{ $event->step_amount }})</th>
{{--                    <th scope="col" style="width: 10%">Longest</th>--}}
                </tr>
                </thead>
                <tbody>

                @foreach ($register_users as $key => $user)
                    @php
                        $user_step = $user->total_step;
                        $target_step = $event->step_amount;
                        $percent = $user_step*100/$target_step;
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
                            <div class="progress position-relative">
                                <div class="progress-bar" role="progressbar" style="width: {{ $percent }}%" aria-valuenow="{{ $percent }}" aria-valuemin="0" aria-valuemax="100"></div>
                                <small class="justify-content-center d-flex position-absolute w-100">{{ $user_step }} ({{ $percent }}%) complete</small>
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
