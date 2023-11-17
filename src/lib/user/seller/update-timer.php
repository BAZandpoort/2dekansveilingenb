<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

// Check if the 'change' parameter is set in the POST request
if (isset($_POST['change'])) {
  // Get the new end date from the POST data
  $endDate = $_POST['endDate'];
  // Get the product ID from the POST data
  $id = $_POST['id'];
  // Prepare the SQL query to update the end date of the product
  $query = 'UPDATE products SET endDate = ? WHERE id = ?';
  // Execute the query and store the success status
  $success = insert(
    $query,
    ['type' => 's', 'value' => $endDate],
    ['type' => 'i', 'value' => $id]
  );

  // Check if the update was successful
  if ($success) {
      // Print a success message
      echo "Auction end date updated successfully.";
  } else {
      // Print an error message
      echo "Failed to update the auction end date.";
  }
}

// Redirect the user to the product time edit page in the dashboard
header('location: /dashboard/products/time/edit');


?>