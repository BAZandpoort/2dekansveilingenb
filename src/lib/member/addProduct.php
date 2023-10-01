<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['add'])) {
  [$userid, $categoryid, $name, $description, $price, $imageUrl] = [
    $_POST['userid'],
    $_POST['categoryid'],
    $_POST['name'],
    $_POST['description'],
    $_POST['price'],
    $_POST['imageUrl'],
  ];

  $insertData = addProduct(
    $userid,
    $categoryid,
    $name,
    $description,
    $price,
    $imageUrl,
  );
}

function addProduct(
  $userid,
  $categoryid,
  $name,
  $description,
  $price,
  $imageUrl,
) {
  $query = 'INSERT INTO products (userid, categoryid, name, description, price, imageUrl)
            VALUES (?, ?, ?, ?, ?, ?)';
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
