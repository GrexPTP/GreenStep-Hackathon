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
    </div>
</nav>

<!-- Page Content -->
<div class="container">

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
    <form action="{{ route('account.postRegister') }}" method="POST">
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
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Phone</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Birthday</label>
                            <input type="date" name="birthday" class="form-control" required>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-5 col-md-5 mb-8">
                <div class="card h-100">
                    <br>
                    <h3 class="text-center">Account</h3>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="name">Username</label>
                            <input type="password" name="current_pass" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Re-Password</label>
                            <input type="password" name="re_password" class="form-control" required>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-md-10">
                <hr>
                <input type="submit" class="btn btn-success" style="width: 100%" value="Register">

            </div>


        </div>

        <br><br>
        <!-- /.row -->
    </form>
    <br>
    <br>

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
