<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$user = $_SESSION['user'];

if (isset($_POST['bid'])) {
  var_dump($_POST);
  $userId = $user['id'];
  $productId = $_POST['productid'];
  $bidPrice = $_POST['amount'];

  $query = 'SELECT *, COUNT(*) AS amount FROM bids WHERE productid = ?';
  $result = fetch(
    $query,
    ["type" => "i", "value" => $productId]
  );
  $bidId = $result["id"];
  var_dump($result);

  if ($result["amount"] === 0) {
    $query = 'INSERT INTO bids (productid, bidder, price) VALUES (?, ?, ?)';
    insert(
      $query,
      ['type' => 'i', 'value' => $productId],
      ['type' => 'i', 'value' => $userId],
      ['type' => 'd', 'value' => $bidPrice],
    );
  } else {
    $query = 'UPDATE bids SET price = ?, bidder = ? WHERE id = ?';
    insert(
      $query,
      ['type' => 'd', 'value' => $bidPrice],
      ['type' => 'i', 'value' => $userId],
      ['type' => 'i', 'value' => $bidId],
    );
  }
}

header('Location: ' . $_SERVER['HTTP_REFERER']);