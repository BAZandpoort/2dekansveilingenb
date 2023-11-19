<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['change'])) { // Check if the 'change' parameter is set in the POST request
  $endDate = $_POST['endDate']; // Get the value of 'endDate' from the POST request
  $id = $_POST['id']; // Get the value of 'id' from the POST request
  $query = 'UPDATE products SET endDate = ? WHERE id = ?'; // SQL query to update the 'endDate' column in the 'products' table
  $success = insert( // Call the 'insert' function to execute the SQL query
    $query,
    ['type' => 's', 'value' => $endDate], // Bind the 'endDate' value as a string parameter
    ['type' => 'i', 'value' => $id] // Bind the 'id' value as an integer parameter
);

  if ($success) {
      echo "Auction end date updated successfully.";
  } else {
      echo "Failed to update the auction end date.";
  }
}
header('location: /dashboard/products/time/edit')

?>