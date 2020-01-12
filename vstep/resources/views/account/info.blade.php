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
<form action="{{ route('account.postInfo') }}" method="POST">
@csrf
<!-- Page Features -->
<div class="row">
    <div class="col-lg-5 col-md-5 mb-8">
        <div class="card h-100">
            <br>
            <h3 class="text-center">Basic Informations</h3>
            <div class="card-body">
                <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" class="form-control" value="{{ $user->name }}" required>
                </div>

                <div class="form-group">
                    <label for="name">Phone</label>
                    <input type="text" name="phone" class="form-control" value="{{ $user->phone }}" required>
                </div>

                <div class="form-group">
                    <label for="name">Birthday</label>
                    <input type="date" name="birthday" class="form-control" value="{{ $user->birthday }}" required>
                </div>
            </div>

        </div>
    </div>

    <div class="col-lg-5 col-md-5 mb-8">
        <div class="card h-100">
            <br>
            <h3 class="text-center">Password</h3>
            <div class="card-body">
                <div class="form-group">
                    <label for="name">Current</label>
                    <input type="password" name="current_pass" class="form-control">
                </div>

                <div class="form-group">
                    <label for="name">New Password</label>
                    <input type="password" name="password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="name">Birthday</label>
                    <input type="password" name="re_password" class="form-control">
                </div>
            </div>

        </div>
    </div>

    <div class="col-md-10">
        <hr>
        <input type="submit" class="btn btn-success" style="width: 100%" value="Update Information">

    </div>


</div>

<br><br>
<!-- /.row -->
</form>
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
