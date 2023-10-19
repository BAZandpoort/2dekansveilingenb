<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['change'])) {
  $endDate = $_POST['endDate'];
  $id = $_POST['id'];
  $query = 'UPDATE products SET endDate = ? WHERE id = ?';
  $success = insert(
    $query,
    ['type' => 's', 'value' => $endDate],
    ['type' => 'i', 'value' => $id]
);

  if ($success) {
      echo "Auction end date updated successfully.";
  } else {
      echo "Failed to update the auction end date.";
  }
}
header('location: /dashboard/products/edit-time')

?>