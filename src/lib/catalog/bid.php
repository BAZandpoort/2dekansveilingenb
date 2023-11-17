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

  $query = 'INSERT INTO bidshistory (productid, userid, bidPrice) VALUES (?, ?, ?)';
    $insert1=insert(
      $query,
      ['type' => 'i', 'value' => $productid],
      ['type' => 'i', 'value' => $userid],
      ['type' => 'd', 'value' => $bid_price],
    ); 

$maxproductData = fetch("SELECT MAX(productid) AS maxid From `bidshistory`");


  $currentData = fetchSingle( "SELECT * FROM `bidshistory` WHERE productid = ? ORDER BY bidPrice DESC" , ['type' => 'i', 'value' => $productid]);

  foreach($currentData as $data){
   
  $query = 'INSERT INTO notification_read (notificationid, userid, `read` , userid2) VALUES (?, ?, ?, ?)';

 $insert2= insert(
    $query,
    ['type' => 'i', 'value' => $data ["id"]],
    ['type' => 'i', 'value' => $userid],
    ['type' => 'd', 'value' => 0],
    ['type' => 'i', 'value' => $data["userid"]]
  ); 
    break;
}



$query = 'INSERT INTO bidshistory (productid, userid, bidPrice) VALUES (?, ?, ?)';
    $insert1=insert(
      $query,
      ['type' => 'i', 'value' => $productid],
      ['type' => 'i', 'value' => $userid],
      ['type' => 'd', 'value' => $bid_price],
    ); 

$maxproductData = fetch("SELECT MAX(productid) AS maxid From `bidshistory`");


  $currentData = fetchSingle( "SELECT * FROM `bidshistory` WHERE productid = ? ORDER BY bidPrice DESC" , ['type' => 'i', 'value' => $productid]);

  foreach($currentData as $data){
   
  $query = 'INSERT INTO notification_read (notificationid, userid, `read` , userid2) VALUES (?, ?, ?, ?)';

 $insert2= insert(
    $query,
    ['type' => 'i', 'value' => $data ["id"]],
    ['type' => 'i', 'value' => $userid],
    ['type' => 'd', 'value' => 0],
    ['type' => 'i', 'value' => $data["userid"]]
  ); 
    break;
}




// Fetch product details
$query = 'SELECT id, name, price, imageUrl FROM products WHERE id = ?';
$product = fetch($query, ['type' => 'i', 'value' => $productid]);

// Check if the product was found
if ($product) {
    // Define the variables
    $userid = $user['id'];
    $productid = $product['id'];
    $price = $product['price'];
    $productName = $product['name'];
    $productImage = $product['imageUrl'];

    // Insert into user_purchases
    $query = 'INSERT INTO user_purchases (id, timeOfPurchase, productId, price, productName, productImage) VALUES (?, now(), ?, ?, ?, ?)';
    insert(
        $query,
        ['type' => 'i', 'value' => $userid],
        ['type' => 'i', 'value' => $productid],
        ['type' => 'i', 'value' => $price],
        ['type' => 's', 'value' => $productName],
        ['type' => 's', 'value' => $productImage],
    );
} else {
    // Handle the case where the product was not found
    echo 'Product not found';
}
//exit
header('Location: /catalog/product?id=' . $productid);
}
?>