<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>VStep - Challenge Onliny System</title>

    <!-- Bootstrap core CSS -->

    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/summernote/summernote-bs4.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/vstep.css">
    <link rel="stylesheet" href="https://rawgit.com/gionkunz/chartist-js/master/dist/chartist.min.css">

    <!-- Custom styles for this template -->
    <link href="/assets/css/heroic-features.css" rel="stylesheet">
    <link href="/assets/css/chart.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="{{ route('home') }}">Logo</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item">
                    <a class="nav-link" href="#"><b>#{{ App\User::find(Auth::id())->getCurrentRank() }} <sup>{{ App\User::find(Auth::id())->getPoint() }}</sup> </b></a>
                </li>
                @if(Auth::id())
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('account.challenges') }}"><b><span class="red-rank">@if (Auth::check()) {{ Auth::user()->name
                         }} @endif</span></b></a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('account.challenges') }}"><b><span class="red-rank">@if (Auth::check()) {{ Auth::user()->name
                         }} @endif</span></b></a>
                    </li>
                @endif
                <li class="nav-item">
                    <a class="nav-link" href="#"><img src="" alt=""></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    @yield('content')


</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; VStep 2020 - Product from Hackathon Edu FPT 2019</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->

<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/summernote/summernote-bs4.js"></script>

@yield('js')

</body>

</html>
