<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Jeepney Fair App</title>
        <link rel='stylesheet' href='css/bootstrap.css'>
        <style>
            html, body { height: 100%; margin: 0;padding: 0; }
            #map{ height: 95%;width: 60%; float: left;}
            #result { width: 40%;float: right;}
        </style>
        <?php
            $stops=array();
            require 'PHP_DBValidate.php';
            $sql="SELECT * FROM direction INNER JOIN stop ON direction.stop_id=stop.stop_id";
            $result=mysqli_query($conn, $sql);
            if (mysqli_num_rows($result)>0) {
                while ($row= mysqli_fetch_assoc($result)) {
                    array_push($stops, array("route"=>$row["route_id"],
                                             "name"=>$row["stop_name"], 
                                             "latitude"=>$row["stop_latitude"],
                                             "longitude"=>$row["stop_longitude"],
                                             "direction"=>$row["direction_id"],
                                             "interchange"=>$row["interchange"]));
                }
            }
        ?>
    </head>
    <body>
        <div class='container-fluid'>
            <div class='row'>
                <div class='go col-md-10 col-md-offset-1'>
                <div class="row">
                    <div class="col-sm-6">
                    <input id="origin-input" class="controls form-control" type="text" placeholder="Enter an origin location">                            
                    </div>
                    <div class="col-sm-6">
                    <input id="destination-input" class="controls form-control" type="text" placeholder="Enter a destination location">                            
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div id="map"></div>
        <div id="result">
            <h1>Hello out there!</h1>
        </div>
        <script src="js/jquery.min.js"></script>
        <script>
          function initMap() {
            var service = new google.maps.DirectionsService;
            var map = new google.maps.Map($("#map")[0]);
            // list of points
            var stations = [
            <?php
                for ($x=0; $x<  count($stops); $x++) {
                        if ($stops[$x]['direction']>=30&&$row['direction']<=48){
                            echo '{lat:'.$stops[$x]["latitude"].', lng: '.$stops[$x]["longitude"].', name:"'.$stops[$x]["name"].'"},';
                        }                 
                }
            ?>
                // ... as many other stations as you need
            ];

            // Zoom and center map automatically by stations (each station will be in visible map area)
            var lngs = stations.map(function(station) { return station.lng; });
            var lats = stations.map(function(station) { return station.lat; });
            map.fitBounds({
                west: Math.min.apply(null, lngs),
                east: Math.max.apply(null, lngs),
                north: Math.min.apply(null, lats),
                south: Math.max.apply(null, lats),
            });

//            // Show stations on the map as markers
//            for (var i = 0; i < stations.length; i++) {
//                new google.maps.Marker({
//                    position: stations[0],
//                    map: map,
//                    title: stations[0].name
//                });
//            }
            new google.maps.Marker({
                position: stations[0],
                map: map,
                title: stations[0].name
            });
            new google.maps.Marker({
                position: stations[stations.length-1],
                map: map,
                title: stations[stations.length-1].name
            });
            // Divide route to several parts because max stations limit is 25 (23 waypoints + 1 origin + 1 destination)
            for (var i = 0, parts = [], max = 25 - 1; i < stations.length; i = i + max)
                parts.push(stations.slice(i, i + max + 1));

            // Service callback to process service results
            var service_callback = function(response, status) {
                if (status != 'OK') {
                    console.log('Directions request failed due to ' + status);
                    return;
                }
                var renderer = new google.maps.DirectionsRenderer;
                renderer.setMap(map);
                renderer.setOptions({ suppressMarkers: true, preserveViewport: true });
                renderer.setDirections(response);
            };

            // Send requests to service to get route (for stations count <= 25 only one request will be sent)
            for (var i = 0; i < parts.length; i++) {
                // Waypoints does not include first station (origin) and last station (destination)
                var waypoints = [];
                for (var j = 1; j < parts[i].length - 1; j++)
                    waypoints.push({location: parts[i][j], stopover: false});
                // Service options
                var service_options = {
                    origin: parts[i][0],
                    destination: parts[i][parts[i].length - 1],
                    waypoints: waypoints,
                    travelMode: 'DRIVING'
                };
                // Send request
                service.route(service_options, service_callback);
            }
          }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAkLdeeM1urmtXdaxnT-SX6KsUHlpfqaA
        &callback=initMap"></script>
    </body>
</html>
