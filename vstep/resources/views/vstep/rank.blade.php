@extends('master.master')
@section('content')
    <div class="challenge-title">
        <h4>Rank Runner List</h4>
    </div>
    <!-- Page Features -->
    <form method="POST" action="">
        @csrf

        <div class="row">
            <div class="col-lg-12 col-md-12 mb-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="text-center">
                            <b ><u>Rules</u></b>
                        </div>
                       <p>
                            Thank you for using VStep System. A small gift for you for your trying in our system.
                       </p>
                        <p>
                            If you get our target point. Your username color will be change into its color.
                        </p>
                        <p><i>Our friends</i></p>
                        <p>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Point</th>
                                <th>Title</th>
                                <th>Account Color</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($data as $rank)
                                <tr>
                                    <td>{{ $rank->point }}</td>
                                    <td><span style="color: {{ $rank->color }}"><b>{{ $rank->title }}</b></span></td>
                                    <td><span style="color: {{ $rank->color }}"><b>user</b></span></td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <!-- /.row -->

    <!-- Page Features -->


    <br>
    <br>
@endsection
