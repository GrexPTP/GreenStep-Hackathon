@extends('master.master')
@section('content')

    <br>
    <h1><span class="red-rank">Challenge</span> Static</h1>
    <div class="col-lg-12">
        <div class="row">
            <div class="col-md-4">
                <a href="{{ route('account.challenges') }}" class="btn btn-primary full-btn">Challenge Stats</a>
            </div>
            <div class="col-md-4">
                <a href="{{ route('account.challenges') }}" class="btn btn-primary full-btn">Common Stats</a>
            </div>

            <div class="col-md-4">
                <a href="{{ route('account.challenges') }}" class="btn btn-primary full-btn">Account Information</a>
            </div>
        </div>
    </div>
    <hr>
    <!-- Page Features -->
    <div class="row text-center">
        <div class="col-lg-12 col-md-12 mb-12">
            <div class="card h-100">
                <br>
                <h3>My Challenges</h3>
                <div class="card-body">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Challenge Name</th>
                            <th scope="col">Start Date</th>
                            <th scope="col">End Date</th>
                            <th scope="col">Number Register</th>
                            <th scope="col">Status</th>

                        </tr>
                        </thead>
                        <tbody>

                        @foreach ($my_challenges as $key => $challenge)
                            <tr>
                                <th scope="row">{{ $key+1 }}</th>
                                <td>{{ $challenge->name }}</td>
                                <td>{{ $challenge->start_date }}</td>
                                <td>{{ $challenge->end_date }}</td>
                                <td>{{ $challenge->register_users()->count() }}</td>
                                <td>{{ $challenge->status }}</td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <br><br>
    <div class="row text-center">
        <div class="col-lg-12 col-md-12 mb-12">

            <div class="card h-100">
                <br>
                <h3>Joined Challenges</h3>
                <div class="card-body">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Challenge Name</th>
                            <th scope="col">Start Date</th>
                            <th scope="col">End Date</th>
                            <th scope="col">Number Register</th>
                            <th scope="col">Status</th>
                            <th scope="col">Rank</th>

                        </tr>
                        </thead>
                        <tbody>

                        @foreach ($joined_challenges as $key => $challenge)
                            <tr>
                                <th scope="row">{{ $key+1 }}</th>
                                <td>{{ $challenge->name }}</td>
                                <td>{{ $challenge->start_date }}</td>
                                <td>{{ $challenge->end_date }}</td>
                                <td>{{ $challenge->register_users()->count() }}</td>
                                <td>{{ $challenge->status }}</td>
                                <td>{{ App\User::find(Auth::id())->challengeRank($challenge->id) }}</td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <!-- /.row -->

    <br>
    <br>
@endsection
