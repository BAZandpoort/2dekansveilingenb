<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$user = $_SESSION['user'];


if (isset($_POST['bid'])) {
  $userid = $user['id'];
  $productid = $_POST['productid'];
  $bid_price = $_POST['amount'];
 
  $query = 'SELECT *, COUNT(*) AS amount FROM bids WHERE productid = ? AND userid = ?';
  $result = fetch($query, ["type" => "i", "value" => $productid], ["type" => "i", "value" => $userid]);
  $bid_id = $result["id"];

  if ($result["amount"] == 0){
        $query = 'INSERT INTO bids (productid, userid, bidPrice) VALUES (?, ?, ?)';
        insert(
            $query,
            ['type' => 'i', 'value' => $productid],
            ['type' => 'i', 'value' => $userid],
            ['type' => 'd', 'value' => $bid_price],
        );  
  } else {
        $query = 'UPDATE bids SET bidPrice = ?, bidOfferedAt = now() WHERE id = ?';
        insert(
            $query,
            ['type' => 'd', 'value' => $bid_price],
            ['type' => 'i', 'value' => $bid_id],
        );
  }

  
}
header('Location: '.$_SERVER['HTTP_REFERER']);
return
;

