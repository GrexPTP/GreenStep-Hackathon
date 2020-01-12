@extends('master.master')
@section('content')
    <div class="challenge-title">
        <h4>{{ $event->name }}</h4>
    </div>
    <!-- Page Features -->
    <form method="POST" action="">
        @csrf

        <div class="row">
        <div class="col-lg-12 col-md-12 mb-12">
            <div class="card h-100">
                <div class="card-body">
                    <div class="text-center">
                        <b ><u>Rules & Regulations</u></b>
                    </div>
                    {{ $event->description }}
                </div>
                <div class="card-footer text-center">
                    <input type="submit" class="btn btn-primary" value="Ok, I agree !"/>
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
