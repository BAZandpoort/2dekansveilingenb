<?php

require_once '../../../config.php';
require_once LIB . '/util/util.php';
require_once LIB . '/authentication/authentication.php';

if (isset($_POST['add'])) {
    $userid = $_POST['userid'];
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $imageUrl = $_POST['imageUrl'];
    
    $sql = "INSERT INTO products (userid, name, description, price, imageUrl ) VALUES ('".$userid."', '".$name."', '".$description."', '".$price."', '".$imageUrl."')";
    if ($connection->query($sql)) {
      echo "Record succesvol toegevoegd<br>";
  } else {
      echo "Error record toevoegen: ". $connection->error."<br>";
  }
  $connection->close();
 }
header('Location: /');
