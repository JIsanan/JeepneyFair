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
            #map{ height: 95%;width: 50%;}
        </style>
        <?php
                $servername = "localhost";
                $username = "root";
                $password = "";

                // Create connection
                $conn = new mysqli($servername, $username, $password);

                // Check connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
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
                {lat: 48.9812840, lng: 21.2171920, name: 'Station 1'},
                {lat: 48.9832841, lng: 21.2176398, name: 'Station 2'},
                {lat: 48.9856443, lng: 21.2209088, name: 'Station 3'},
                {lat: 48.9861461, lng: 21.2261563, name: 'Station 4'},
                {lat: 48.9874682, lng: 21.2294855, name: 'Station 5'},
                {lat: 48.9909244, lng: 21.2295512, name: 'Station 6'},
                {lat: 48.9928871, lng: 21.2292352, name: 'Station 7'},
                {lat: 48.9921334, lng: 21.2246742, name: 'Station 8'},
                {lat: 48.9943196, lng: 21.2234792, name: 'Station 9'},
                {lat: 48.9966345, lng: 21.2221262, name: 'Station 10'},
                {lat: 48.9981191, lng: 21.2271386, name: 'Station 11'},
                {lat: 49.0009168, lng: 21.2359527, name: 'Station 12'},
                {lat: 49.0017950, lng: 21.2392890, name: 'Station 13'},
                {lat: 48.9991912, lng: 21.2398272, name: 'Station 14'},
                {lat: 48.9959850, lng: 21.2418410, name: 'Station 15'},
                {lat: 48.9931772, lng: 21.2453901, name: 'Station 16'},
                {lat: 48.9963512, lng: 21.2525850, name: 'Station 17'},
                {lat: 48.9985134, lng: 21.2508423, name: 'Station 18'},
                {lat: 49.0085000, lng: 21.2508000, name: 'Station 19'},
                {lat: 49.0093000, lng: 21.2528000, name: 'Station 20'},
                {lat: 49.0103000, lng: 21.2560000, name: 'Station 21'},
                {lat: 49.0112000, lng: 21.2590000, name: 'Station 22'},
                {lat: 49.0124000, lng: 21.2620000, name: 'Station 23'},
                {lat: 49.0135000, lng: 21.2650000, name: 'Station 24'},
                {lat: 49.0149000, lng: 21.2680000, name: 'Station 25'},
                {lat: 49.0171000, lng: 21.2710000, name: 'Station 26'},
                {lat: 49.0198000, lng: 21.2740000, name: 'Station 27'},
                {lat: 49.0305000, lng: 21.3000000, name: 'Station 28'},
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

            // Show stations on the map as markers
            for (var i = 0; i < stations.length; i++) {
                new google.maps.Marker({
                    position: stations[i],
                    map: map,
                    title: stations[i].name
                });
            }

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
