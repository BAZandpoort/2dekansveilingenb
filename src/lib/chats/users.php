<?php

session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$sql = mysqli_query($connection, "SELECT * FROM users");
$output = "";

if (mysqli_num_rows($sql) == 1)
{
    $output .= "No users available to chat"; 
} elseif (mysqli_num_rows($sql) > 0)
{
    while ($row = mysqli_fetch_assoc($sql)) {
        $output .= '';
    }
}




?>