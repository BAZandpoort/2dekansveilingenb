<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['add'])) {
  $userid = $_POST['userid'];
  $name = $_POST['name'];
  $description = $_POST['description'];
  $price = $_POST['price'];
  $imageUrl = $_POST['imageUrl'];

  $query = 'INSERT INTO products (userid, name, description, price, imageUrl ) VALUES (?, ?, ?, ?, ?)';
  $insertData = insert(
    $query,
    ['type' => 'i', 'value' => $userid],
    ['type' => 's', 'value' => $name],
    ['type' => 's', 'value' => $description],
    ['type' => 'd', 'value' => $price],
    ['type' => 's', 'value' => $imageUrl],
  );

  return $insertData;
}

header('Location: /producten');
