<?php
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    $conn = mysqli_connect("localhost", "root", "", "admin_jeepney");
    if (!$conn) {
        echo '<h2>Connection to database failed.</h2>';
        die();
    }
