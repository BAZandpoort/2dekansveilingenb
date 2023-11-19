<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$user = $_SESSION['user'];

if (isset($_POST['bid'])) {
  $bidId = $user['id'];
  $productId = $_POST['productid'];
  $bidPrice = $_POST['amount'];

  $query = 'SELECT *, COUNT(*) AS amount FROM bids WHERE productid = ? AND userid = ?';
  $result = fetch(
    $query,
    ["type" => "i", "value" => $productId],
    ["type" => "i", "value" => $bidId]
  );
  $bidId = $result["id"];
  var_dump($result);

  if ($result["amount"] == 0) {
    $query = 'INSERT INTO bids (productid, userid, bidPrice) VALUES (?, ?, ?)';
    insert(
      $query,
      ['type' => 'i', 'value' => $productId],
      ['type' => 'i', 'value' => $bidId],
      ['type' => 'd', 'value' => $bidPrice],
    );
  } else {
    $query = 'UPDATE bids SET bidPrice = ? WHERE id = ?';
    insert(
      $query,
      ['type' => 'd', 'value' => $bidPrice],
      ['type' => 'i', 'value' => $bidId],
    );
  }
}

header('Location: ' . $_SERVER['HTTP_REFERER']);