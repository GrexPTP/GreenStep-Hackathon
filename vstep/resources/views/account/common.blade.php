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
                <a href="{{ route('account.common') }}" class="btn btn-primary full-btn">Common Stats</a>
            </div>

            <div class="col-md-4">
                <a href="{{ route('account.info') }}" class="btn btn-primary full-btn">Account Information</a>
            </div>
        </div>
    </div>
    <hr>
    <!-- Page Features -->
    <div class="row">
        <div class="col-lg-9 col-md-9 mb-8">
            <div class="card h-100">
                <br>
                <h3 class="text-center">My Challenge Stats</h3>
                <div class="card-body">
                    <canvas id="chLine" height="100"></canvas>
                </div>

            </div>
        </div>

        <div class="col-lg-3 col-md-3 mb-4">
            <div class="card h-100">
                <br>
                <div class="card-body">
                    <ul>
                        <li>Joined <b>{{ $joined_challenges->count() }}</b> challenges </li>
                        <li>Created <b>{{ $my_challenges->count() }} </b>challenges </li>
                        <li>Highest Rank: <b>{{ App\User::find(Auth::id())->highestRank() }} </b></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <br><br>
    <!-- /.row -->

    <br>
    <br>
@endsection

@section('js')
    <script src="/assets/js/chart.js"></script>

    <script>
        $(document).ready(function() {
            /* chart.js chart examples */

            var colors = ['#007bff','#28a745','#333333','#c3e6cb','#dc3545','#6c757d'];

            /* large line chart */
            var chLine = document.getElementById("chLine");
            var chartData = {
                labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                datasets: [{
                    data: [1, 445, 483, 503, 689, 692, 634],
                    backgroundColor: 'transparent',
                    borderColor: colors[0],
                    borderWidth: 4,
                    pointBackgroundColor: colors[0]
                },
                    {
                        data: [639, 465, 493, 478, 589, 632, 674],
                        backgroundColor: colors[3],
                        borderColor: colors[1],
                        borderWidth: 4,
                        pointBackgroundColor: colors[1]
                    }]
            };

            if (chLine) {
                new Chart(chLine, {
                    type: 'line',
                    data: chartData,
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: false
                                }
                            }]
                        },
                        legend: {
                            display: false
                        }
                    }
                });
            }
        });
    </script>
@endsection
