<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['change'])) {
  $endDate = $_POST['endDate'];
  $id = $productData['id']; // Assuming you have the product ID available in $productData

  $query = 'UPDATE products SET endDate = ? WHERE id = ?';
  $success = fetch(
    $query,
    ['type' => 's', 'value' => '' . $endDate . ''],
    ['type' => 'i', 'value' => $id]
);

  if ($success) {
      echo "Auction end date updated successfully.";
  } else {
      echo "Failed to update the auction end date.";
  }
}
?>