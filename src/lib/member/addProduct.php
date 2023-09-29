<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['add'])) {
  $userid = $_POST['userid'];
  $categoryid = $_POST['categoryid'];
  $name = $_POST['name'];
  $description = $_POST['description'];
  $price = $_POST['price'];
  $imageUrl = $_POST['imageUrl'];

  $is_auction = isset($_POST["auction_duration"]);
  if ($is_auction){
    $auction_end_time = $_POST["auction_duration"];
  } else {
    $auction_end_time = null;
  }

  $query = 'INSERT INTO products (userid, categoryid, name, description, price, imageUrl ) VALUES (?, ?, ?, ?, ?, ?)';
  $insertData = insert(
    $query,
    ['type' => 'i', 'value' => $userid],
    ['type' => 'i', 'value' => $categoryid],
    ['type' => 's', 'value' => $name],
    ['type' => 's', 'value' => $description],
    ['type' => 'd', 'value' => $price],
    ['type' => 's', 'value' => $imageUrl],
  );

  return $insertData;
  
}
header('Location: /');
return;

