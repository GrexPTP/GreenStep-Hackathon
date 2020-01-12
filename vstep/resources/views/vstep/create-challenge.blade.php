@extends('master.master')
@section('content')

    <br>
    <br>
    <!-- Page Features -->
    <div class="row">
        <div class="col-lg-12 col-md-12 mb-12">
            <div class="card h-100">
                <div class="card-body">


                    <h4>Settings</h4>
                    <form action="{{ route('challenge.postCreate') }}" method="POST">
                        @csrf
                        <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="challenge_name">Challenge Name</label>
                                <input type="text" class="form-control" name="challenge_name" id="challenge_name">
                            </div>

                            <div class="form-group">
                                <label for="challenge_name">Type</label>
                                <select name="type" id="type" class="form-control">
                                    <option value="step">Step</option>
                                    <option value="martathon">Marathon</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="step_amount">Step</label>
                                <input type="text" class="form-control" name="step_amount" id="step_amount">
                            </div>

                            <div class="form-group">
                                <label for="distance">Distance</label>
                                <input type="text" class="form-control" name="distance" id="distance">
                            </div>

                            <div class="form-group">
                                <label for="distance">Start Point</label>
                                <input type="text" class="form-control" name="start_point" id="start_point" readonly>
                            </div>

                            <div class="form-group">
                                <label for="distance">End Point</label>
                                <input type="text" class="form-control" name="end_point" id="end_point" readonly>
                            </div>

                            <div class="col-lg-12">
                                <div class="row">
                                    <div id="myMap" style="position:relative;width:600px;height:400px;"></div>

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="start_date">Start Date</label>
                                <input type="date" name="start_date" id="start_date" min="1000-01-01"
                                       max="3000-12-31" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="start_time">From Time</label>
                                <input type="time" name="start_time" id="start_time" min="1000-01-01"
                                       max="3000-12-31" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="end_date">End Date</label>
                                <input type="date" name="end_date" id="end_date" min="1000-01-01"
                                       max="3000-12-31" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="end_time">End Time</label>
                                <input type="time" name="end_time" id="end_time" min="1000-01-01"
                                       max="3000-12-31" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="end_time">Description</label>
                                <textarea name="description" class="summernote"></textarea>
                            </div>
                        </div>
                        </div>




                </div>

                <div class="card-footer text-center">
                    <input type="submit" class="btn btn-primary" value="Create Challenge"></input>
                </div>
            </div>
        </div>

        </form>




    </div>
    <br><br>
@stop
<!-- Footer -->

@section('js')

<!-- Bootstrap core JavaScript -->
<script>
    $(document).ready(function() {
        $("input[name=distance]").parent().toggle();
        $("input[name=start_point]").parent().toggle();
        $("input[name=end_point]").parent().toggle();
        $("#myMap").toggle();
        $('.summernote').summernote({
            height: 300,
        });
        $('select[name=type]').change(function(){
            $("input[name=step_amount]").parent().toggle();
            $("input[name=distance]").parent().toggle();
            $("input[name=start_point]").parent().toggle();
            $("input[name=end_point]").parent().toggle();
            $("#myMap").toggle();
        })
    });
</script>

<script type='text/javascript'>
    var map;
    function GetMap() {
        map = new Microsoft.Maps.Map('#myMap', {});
        //Add mouse events to the map.
        Microsoft.Maps.Events.addHandler(map, 'dblclick', function(e){
            var start_point = {};
            var end_point = {};

            var lat_p = e.location.latitude;
            var long_p = e.location.longitude;
            if ($("input[name=start_point]").val()==''){
                start_point.x = lat_p;
                start_point.y = long_p;
                $("input[name=start_point]").val(JSON.stringify(start_point))
                alert("Start Point Updated !");
            } else {
                end_point.x = lat_p;
                end_point.y = long_p;
                $("input[name=end_point]").val(JSON.stringify(end_point))
                alert("End Point Updated !");
            }
            console.log(start_point);


        });
    }
</script>
<script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=Aspw2kePH6Rnv_SAUMfCVdOiKijNeGkNrn-JWwUt1GccN8AthoCDWsQu-7AURDGE' async defer></script>


@stop
