@extends('master.master')
@section('content')

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
        <h1 class="display-3" style="text-align: center; font-weight: 500">Welcome to VStep Challenge !</h1>
    </header>
    <h1>Ranklist <span class="red-rank">January</span></h1>
    <!-- Page Features -->
    <div class="row text-center">
        <div class="col-lg-7 col-md-7 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">User</th>
                            <th scope="col">Challenges</th>
                            <th scope="col">Score</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($ranking as $key => $rank)
                            <tr>
                                <th scope="row">{{ $rank->rank }}</th>
                                <td>{{ App\User::find($rank->user_id)->name }}</td>
                                <td>{{ $rank->challenges }}</td>
                                <td>{{ $rank->total }}</td>
                            </tr>
                        @endforeach



                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <a href="#" class="btn btn-primary">Find Out More!</a>
                </div>
            </div>
        </div>


        <div class="col-lg-5 col-md-5 mb-3">
            <div class="card h-100">
                <div class="card-body">
                    <div class="card mb-4" style="border: 0px solid rgba(0,0,0,.125) !important;">
                        <div class="card-body">
                            @if ($events->count()>0)
                                @php $hot_challenge = $events->first(); @endphp
                            <b class="card-title">{{ $hot_challenge->name }}<sup><small> {{ $hot_challenge->status }} </small></sup></b>
                            <p class="card-text">{!! $hot_challenge->description !!}</p>
                            <a href="{{ route('challenge.register', $hot_challenge->id ) }}" class="btn btn-primary">Register Now</a>
                            @else
                                <p>Be the first <b>challenger</b> today ! </p>
                                <a href="{{ route('challenge.create') }}" class="btn btn-primary">Register Now</a>
                            @endif
                        </div>
                    </div>

                </div>

            </div>
        </div>



    </div>
    <!-- /.row -->

    <h2>Current or Upcoming Contests <a class="btn btn-success float-right" style="font-size: 21px;" href="{{ route('challenge.create') }}"><small>Create your own!</small></a></h2>
    <!-- Page Features -->
    <div class="row text-center">
        <div class="col-lg-12 col-md-12 mb-12">
            <div class="card h-100">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Challenger</th>
                        <th scope="col">Start</th>
                        <th scope="col">Type</th>
                        <th scope="col">Status</th>
                        <th scope="col">Participants</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($events as $event)
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
                            $diff_end = $now>=$end_date;
                        @endphp
                        @if ($diff_start==true && $event->status=="pending")
                            @php

                                $event->status="started";
                                $event->save();
                            @endphp
                        @endif

                        @if ($diff_end==true && $event->status=="started")
                            @php
                                $event->status="ended";
                                $event->save();
                                continue;
                            @endphp
                        @endif

                        <tr>
                            @if ($event->status=="pending")
                                <td><a href="{{ route('challenge.view', $event->id)  }}">{{ $event->name }}</a></td>
                            @elseif ($event->status=="started")
                                <td><a href="{{ route('challenge.view', $event->id)  }}">{{ $event->name }}</a></td>
                            @endif
                            <td><b>{{ $event->creator->name }}</b></td>
                            <td>{{ Carbon\Carbon::parse($event->start_date)->format('M/d/Y') }}
                                {{ Carbon\Carbon::parse($event->start_time)->format('H:i') }}<sup><small>UTC+7</small></sup></td>
                            <td>{{ $event->type = 'step' ? 'Race to '.$event->step_amount : 'Run '.$event->distance.' km'}}</td>
                            @if ($event->status == 'pending')
                                <td>@if($event->hasUser($my_account)) <span class="registered-color">Registered</span> @else<b><i> <a href="{{ route('challenge.register', $event->id ) }}" class="register-color" style="text-decoration: none;"> register @endif</a></i></b></td>
                            @else
                                <td><i>Running</i></td>
                            @endif
                            <td>{{ $event->register_users()->get()->count() }}</td>
                        </tr>
                    @endforeach

                    @foreach ($events_pasts as $event)
                        <tr>
                            <td>{{ $event->name }}</td>
                            <td><b>{{ $event->creator->name }}</b></td>
                            <td>{{ Carbon\Carbon::parse($event->start_date)->format('M/d/Y') }}
                                {{ Carbon\Carbon::parse($event->start_time)->format('H:i') }}<sup><small>UTC+7</small></sup></td>
                            <td>{{ $event->type == 'step' ? 'Race to '.$event->step_amount : 'Run '.$event->distance.' km'}}</td>
                            <td><a href="{{$event->type == 'step' ? route('challenge.view', $event->id) : route('challenge_marathon.view', $event->id)  }}" style="text-decoration: none;">Final Standing</a></td>
                            <td>{{ $event->register_users()->get()->count() }}</td>
                        </tr>
                    @endforeach

                    </tbody>
                </table>
            </div>
        </div>






    </div>


    <br>
    <br>
@endsection
