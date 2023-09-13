<?php

session_start();

require_once '../../config.php';
require_once DATABASE . '/connect.php';

// if (!isset($_SESSION['token'])) {
//   return false;
// }

/*

User caching system:
Cache user data to session variable if not set yet to reduce loadtimes and strain on the database

have two session variables: data and toUpdate
check if data is set & toUpdate is false: no need to refetch user data
if data isnot set of toUpdate is true: refetch user date

*/


$_SESSION["token"] = 2;

$token = $_SESSION['token'];

$sql = 'SELECT * FROM `users` WHERE `id` = ?';

// Create small util function
$stmt = $connection->prepare($sql);
$stmt->bind_param('i', $token);
$stmt->execute();
$result = $stmt->get_result();

if (mysqli_num_rows($result) == 0) {
  echo "unauthorized";
  return;
}

$result = $result->fetch_assoc();

var_dump($result);

?>
