@extends('master.master')
@section('content')
    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
        <h1 class="display-3">Welcome to VStep Challenge !</h1>
        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
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
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>2400</td>
                        </tr>

                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>1200</td>
                        </tr>


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
                            <b class="card-title">Chạy Deadline Hackathon<sup><small> Upcoming </small></sup></b>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a href="confirm-register.html" class="btn btn-primary">Register Now</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>



    </div>
    <!-- /.row -->

    <h2>Current or Upcoming Contests <sup><a href="create-challenge.html"><small>New Challenge</small></a></sup></h2>
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
                        <th scop="col"></th>
                        <th scop="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($events as $event)
                        <tr>
                            <td>{{ $event->name }}</td>
                            <td><b class="red-rank">{{ $event->creator->name }}</b></td>
                            <td>{{ Carbon\Carbon::parse($event->start_date)->format('M/d/Y') }}
                                {{ Carbon\Carbon::parse($event->start_time)->format('H:i') }}<sup><small>UTC+7</small></sup></td>
                            <td><a href="#">{{ '@'.$event->type }}</a></td>
                            @if ($event->status == 'pending')
                                <td><b><i><a href="confirm-register.html" class="register-color">register</a></i></b></td>
                            @else
                                <td><i>Running</i></td>
                            @endif
                            <td><a href="#">x{{ $event->register_users()->get()->count() }}</a></td>
                        </tr>
                    @endforeach


                    <tr>
                        <td>30 Day Running Challenge - Travel with UpRace 2020</td>
                        <td><b class="red-rank">Đại Học FPT</b></td>
                        <td>Jan/10/2020
                            21:05<sup><small>UTC+7</small></sup></td>
                        <td><a href="#">@marathon</a></td>
                        <td><i>Running</i></td>
                        <td><a href="#">x6023</a></td>
                    </tr>


                    <tr>
                        <td>Sun Life Vietnam - Resolution Run 2020</td>
                        <td><b>touris</b></td>
                        <td>Jan/10/2020
                            21:05<sup><small>UTC+7</small></sup></td>
                        <td><a href="#">@step</a></td>
                        <td><a href="#"><u>Final Standing</u></a></td>
                        <td><a href="#">x3223</a></td>
                    </tr>

                    <tr>
                        <td>Quang Binh Discovery Marathon 2020</td>
                        <td><b>phatpt</b></td>
                        <td>Jan/10/2020
                            21:05<sup><small>UTC+7</small></sup></td>
                        <td><a href="#">@marathon</a></td>
                        <td><a href="#"><u>Final Standing</u></a></td>
                        <td><a href="#">x10023</a></td>
                    </tr>

                    <tr>
                        <td>VnExpress Marathon Hanoi Midnight 2020</td>
                        <td><b>duongmd</b></td>
                        <td>Jan/10/2020
                            21:05<sup><small>UTC+7</small></sup></td>
                        <td><a href="#">@time</a></td>
                        <td><a href="#"><u>Final Standing</u></a></td>
                        <td><a href="#">x4323</a></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>






    </div>


    <br>
    <br>
@endsection
