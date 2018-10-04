<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset='UTF-8'>
        <title>Jeepney Fair App</title>
        <link rel='stylesheet' href='css/bootstrap.css'>
        <link rel="stylesheet" href="mystyle.css">
        <style>
            html, body { height: 100%; margin: 0;padding: 0; }
            #map{ height: 800px;width: 100%; float: left;}
            #display { height: auto}
        </style>
        <?php
            $stops=array();
            $initial=array();
            require 'PHP_DBValidate.php';
            $query='SELECT * FROM stop';
            $come=mysqli_query($conn, $query);
            if (mysqli_num_rows($come)>0) {
                while ($row= mysqli_fetch_assoc($come)) {
                    array_push($initial, array('name'=>$row['stop_name'], 
                                             'latitude'=>$row['stop_latitude'],
                                             'longitude'=>$row['stop_longitude'],
                                             'current'=>$row['stop_id']));
                }
            }
        ?>
    </head>
    <body><br>
      <div class="col-xs-2" id="web-body-content-search">
        <form>
          <div class="form-group">
            <label class="sr-only" for="web-body-content-search-bar"></label>
            <input type='hidden' id='start' value=''>
            <input type='hidden' id='end' value=''>
            <input type="text" class="controls form-control web-body-content-search-bar" id="origin" placeholder="Origin Location"><br>
            <input type="text" class="controls form-control web-body-content-search-bar" id="destination" placeholder="Destination Location"><br>
            <button type="button" class="btn btn-primary srcbtn btn-sm" id="dostuff"><span class="glyphicon glyphicon-search"></span></button>
          </div>
        </form>
      </div>
      <div class="col-xs-9" id="web-body-content-list"> 
        <div class="list-group">
          <div class="list-group-item" id="display">
            For Jeeps to Take
            <div id='result'></div><br><br><br>
          </div>
          <div class="list-group-item" id="map">
            For Map
            <div id='map'></div><br><br><br>
          </div>
        </div>
      </div>
    </body>
</html>

<script src='js/jquery.min.js'></script>
<script src="js/Queue.js"></script>
<script async defer src='https://maps.googleapis.com/maps/api/js?libraries=places&key=INSERTKEYHERE&callback=initMap'></script>
    <script>
        var allStops=[
            <?php
                for ($x=0; $x<  count($initial); $x++) {
					echo '{lat:'.$initial[$x]['latitude'].', lng: '.$initial[$x]['longitude'].', name:"'.$initial[$x]['name'].'", current:'.$initial[$x]['current'].'},'.PHP_EOL;          
                }
            ?>
        ];
        var stations=[];
            var adjRoutes = {
                ParentStopID:"",
                JeepToGetHere:"",
                NextStop:"",
        }
    //object stored by route array
        var arrayOfStops = [];
        var route = []; //list of Routes
        var visited = []; //assume
        var destination; //assume
        var queue;
        var renderer;
        var markers=[];   
        var colorCount=0;
            
        function initMap() {
            var box = $(".form-group");
            var origin = $("#origin");
            var dest = $("#destination");
            //var search1 = new google.maps.places.SearchBox(document.getElementById("origin"));
            //var search2 = new google.maps.places.SearchBox(document.getElementById("destination"));
            var service = new google.maps.DirectionsService;
            var map = new google.maps.Map($('#map')[0], {
                zoom: 14,
                center: {lat: 10.309043, lng: 123.891964}
            });
            
            inputBox('.form-group #origin', map);
            inputBox('.form-group #destination', map);
            // list of points
			var first
			var last
            $('#dostuff').on('click', function(){
                var one=$("#start").val();
                var two=$("#end").val();
				$("#result").html("");
                if(one!=="" && two!=="") {
                    first=closestTwoPoints("#start");
                    last=closestTwoPoints("#end");
                    clearMarkers(null);
                    markers.push(new google.maps.Marker({
                        position: first,
                        map: map,
                        title: first["name"]
                    }));
                    markers.push(new google.maps.Marker({
                        position: last,
                        map: map,
                        title: last["name"]
                    }))
                    getRoutes(first, last);
                    for (var x=0; x<route.length; x++) {
                        stations=[];
                        plotRoute(map, service, first, x);
                    }
					for (var x=0; x<route.length; x++) {
						var results=$("#result").html();
						var given=stringStops(route[x].JeepToGetHere);
						var details=getRouteDetails(route[x], map);
						$("#result").html(results+"<h3>Option "+(x+1)+":"+given+"</h3>"+
												  "<p>"+details+"</p><button class='btn, newMe' id='"+x+"' onclick>See Route</button>");
					}
                } else {
                    alert("Please enter your origin/destination.");
                }
            });
            $(document).on('click', '.newMe', function() {
				plotRoute(map, service, first, parseInt($(this).attr('id')));
			});
            //if (origin!==''&&destination!=='') {
                
            //}
        }
        function plotRoute(map, service, first, r) {
                // Zoom and center map automatically by stations (each station will be in visible map area)
            stations.push(first);
            for (var x=0; x<route[r].JeepToGetHere.length; x++){
                stations.push(allStops.find(function (b){return b.current==route[r].Stop[x]}));
            }
            var lngs = stations.map(function(station) { return station.lng; });
            var lats = stations.map(function(station) { return station.lat; });
            map.fitBounds({
                west: Math.min.apply(null, lngs),
                east: Math.max.apply(null, lngs),
                north: Math.min.apply(null, lats),
                south: Math.max.apply(null, lats)
            });
                // Divide route to several parts because max stations limit is 25 (23 waypoints + 1 origin + 1 destination)
            for (var i = 0, parts = [], max = 25 - 1; i < stations.length; i = i + max)
                parts.push(stations.slice(i, i + max + 1));
                // Service callback to process service results
            var service_callback = function(response, status) {
				if (status !== 'OK') {
					console.log('Directions request failed due to ' + status);
					return;
				}
				if (renderer) {
					renderer.setMap(null);
				}
				renderer = new google.maps.DirectionsRenderer({
					polylineOptions: {
					strokeColor: "blue",
					strokeWeight: 4
					}
				});
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
        function inputBox(point, map) {
            var input = $(point)[0];
            var searchBox = new google.maps.places.SearchBox(input);
                //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
                
                // Bias the SearchBox results towards current map's viewport.
            map.addListener('bounds_changed', function() {
                searchBox.setBounds(map.getBounds());
            });
                
            var markers = [];
                // Listen for the event fired when the user selects a prediction and retrieve
                // more details for that place.
            searchBox.addListener('places_changed', function() {
                var places = searchBox.getPlaces();
                if (places.length == 0) {
					return;
                }
                  // Clear out the old markers.
                markers.forEach(function(marker) {
					marker.setMap(null);
                });
                markers = [];
                  
                  // For each place, get the icon, name and location.
                var bounds = new google.maps.LatLngBounds();
                places.forEach(function(place) {
					if (!place.geometry) {
						console.log('Returned place contains no geometry');
						return;
					}
					var icon = {
						url: place.icon,
						size: new google.maps.Size(71, 71),
						origin: new google.maps.Point(0, 0),
						anchor: new google.maps.Point(17, 34),
						scaledSize: new google.maps.Size(25, 25)
					};

						// Create a marker for each place.
					markers.push(new google.maps.Marker({
						map: map,
						icon: icon,
						title: place.name,
						position: place.geometry.location
					}));

					if (place.geometry.viewport) {
						// Only geocodes have viewport.
						bounds.union(place.geometry.viewport);
					} else {
						bounds.extend(place.geometry.location);
					}
						
					if (point==='.form-group #origin') {
						$('.form-group #start').val(place.geometry.location.lat()+', '+place.geometry.location.lng());
					} else {
						$('.form-group #end').val(place.geometry.location.lat()+', '+place.geometry.location.lng());
					}
                });
                map.fitBounds(bounds);
            });
        }
        function rad(x) {return x*Math.PI/180;}
        function closestTwoPoints (spot) {
            var vals=$(spot).val().split(",");
            var lat = parseFloat(vals[0]);
            var lng = parseFloat(vals[1]);
            return find_closest_marker(lat, lng);
        }
        function find_closest_marker(lat, lng) {
            var R = 6371; // radius of earth in km
            var distances = [];
            var closest = -1;
            for(var i=0;i<allStops.length; i++ ) {
                var mlat = allStops[i]["lat"];
                var mlng = allStops[i]["lng"];
                var dLat  = rad(mlat - lat);
                var dLong = rad(mlng - lng);
                var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.cos(rad(lat)) * Math.cos(rad(lat)) * Math.sin(dLong/2) * Math.sin(dLong/2);
                var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                var d = R * c;
                distances[i] = d;
                    if ( closest === -1 || d < distances[closest] ) {
						closest = i;
                    }
                }
                return allStops[closest];
        }
                
        function findAdjacentStops(CurrentStop, originStop)
        {
            var stop;
                $.ajax({
                    url : "getInPhp.inc.php",
                    method : "POST",
                    data : {query : "find", word:CurrentStop}, //query is just a key while word is the currentstop key
                    dataType: "json", 
					async: false,
                    success:function(dataroute){
                        $(dataroute).each(function(key, value){
                            adjRoutes.ParentStopID = CurrentStop; //OLD CURRENTS STOP
                            adjRoutes.JeepToGetHere = value.route_code; // JEEP NAME
                             
                            stop = (value.next_stop == CurrentStop) ? parseInt(value.stop_id) : parseInt(value.next_stop); //store the next route to object
                            adjRoutes.NextStop = parseInt(stop);
                             
                            if(visited.indexOf(stop) <= -1 || stop == destination){
								if(stop != destination){  
									visited.push(stop);
									queue.push(stop);
								}
								arrayOfStops[stop] = adjRoutes;
								if(stop == destination){
									var routeToEnd = {
										JeepToGetHere: [],
										Stop: [],
									}
									var current;
									current = stop;
									while(current != originStop){
										routeToEnd.JeepToGetHere.unshift(arrayOfStops[current].JeepToGetHere);
										routeToEnd.Stop.unshift(arrayOfStops[current].NextStop);
										current = parseInt(arrayOfStops[current].ParentStopID);
									}
									route.push(routeToEnd)
									routeToEnd = [];    
								}
                            }
                            adjRoutes = [];
                        });
                    }
          
                });
//             console.log(arrayOfStops);// the array of Adjacent Stops
  //           console.log(visited)
        }
    
		function getRoutes(start, end)
		{
			var originStop;
			queue = [];     
			visited = [];     
			adjRoutes = [];
			arrayOfStops = [];
			adjRoutes = [];
			route = [];
		  
			originStop = start["current"];
			destination = end["current"];
			queue.push(originStop);

			visited.push(originStop);
			adjRoutes.NextStop = parseInt(originStop);
			arrayOfStops[originStop] = adjRoutes;
		  //routeToEnd = [];    
		  
			var ctr = 0
			while(queue.length > 0 && route.length < 3){ // route.length < 1){
				ctr++
				findAdjacentStops(queue.shift(), originStop)
			}
			if(route.length == 0){
				console.log("The origin stop and destination stop cannot be reached with the current data set.")
			}else if(route.length == 1){
				console.log("only 1 route was found with this dataset")
				console.log(route) // only 1 route was found
			}else if(route.length == 2){
				console.log("only 2 route were found with this dataset")
				console.log(route) // only 1 route was found
			}else{
				console.log("3 or more than 3 routes were found with this dataset")
				console.log(route) // only 1 route was found.
			}
		}
        function clearMarkers(go) {
            for (var c=0; c<markers.length; c++) {
                markers[c].setMap(go);
            }
        }
		function onlyUnique(value, index, self) { 
			return self.indexOf(value) === index;
		}
		function stringStops(arr) {
			var result="";
			var point=arr.filter(onlyUnique);
			for (var i=0; i<point.length; i++) {
				result+=point[i];
				if (i<point.length-1) result+=", ";
			}
			return result;
		}
		function getRouteDetails (big, map) {
			var goes="";
			for (var x=0; x<big.Stop.length; x++) {
				if (x==0) {
					goes+="Take "+big.JeepToGetHere[x]+"<br/>";
				} else if (x>0 && big.JeepToGetHere[x]!=big.JeepToGetHere[x-1]) {
					goes+="Interchange to "+big.JeepToGetHere[x]+" at "+allStops.find(function (b){return b.current==big.Stop[x-1]}).name+"<br/>";
					markers.push(new google.maps.Marker({
                        position: allStops.find(function (b){return b.current==big.Stop[x-1]}),
                        map: map,
						clickable: true,
                        title: allStops.find(function (b){return b.current==big.Stop[x-1]}).name+"-Interchange"
                    }));
				}
			}
			return goes;
		}
        </script>
        