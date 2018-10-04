<?php 
	require("PHP_DBValidate.php");
	if($_POST['query'] == 'find'){
		$stopId = $_POST['word'];
		$query = "SELECT * FROM direction INNER JOIN route ON direction.route_id = route.route_id WHERE direction.stop_id = {$stopId}";
	}
	$res = mysqli_query($conn,$query);
	echo json_encode(mysqli_fetch_all($res, MYSQLI_ASSOC));
?>