<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$user = $_SESSION['user'];

if (isset($_POST['bid'])) {
  $userId = $user['id'];
  $productId = $_POST['productid'];
  $bidPrice = $_POST['amount'];

  $query = 'INSERT INTO bids_history (productid, bidder, price) VALUES (?, ?, ?)';
  insert(
    $query,
    ['type' => 'i', 'value' => $productId],
    ['type' => 'i', 'value' => $userId],
    ['type' => 'd', 'value' => $bidPrice],
  );

  $query = 'SELECT *, COUNT(*) AS amount FROM bids WHERE productid = ?';
  $result = fetch(
    $query,
    ["type" => "i", "value" => $productId]
  );
  $bidId = $result["id"];

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

    $query = 'SELECT * FROM bids_history WHERE productid = ? ORDER BY price DESC';
    $data = fetchSingle(
      $query,
      ["type" => "i", "value" => $productId]
    );

    if ($data[1]["bidder"] !== $userId) {
      $query = 'INSERT INTO notifications (bidid, userid, userid2) VALUES (?, ?, ?)';
      insert(
        $query,
        ['type' => 'i', 'value' => $data[0]["id"]],
        ['type' => 'i', 'value' => $userId],
        ['type' => 'i', 'value' => $data[1]["bidder"]],
      );
    }
  }
}

header('Location: ' . $_SERVER['HTTP_REFERER']);