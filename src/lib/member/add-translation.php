<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['add'])) {
  $text_en = $_POST['text_en'];
  $text_nl = $_POST['text_nl'];
  $text_fr = $_POST['text_fr'];
  $description = $_POST['description'];
  $price = $_POST['price'];
  $imageUrl = $_POST['imageUrl'];

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
