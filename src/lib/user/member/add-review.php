<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  session_start();
  
  $review = $_POST['review'];
  $rating = $_POST['rating'];
  
  $userId = $_SESSION['user']['id'];

  // Fetch seller information
  $sellerId = $_POST['seller'];

  // Check if user has already reviewed the seller
  $insertReview = fetchSingle('SELECT * FROM reviews WHERE userid = ? AND sellerid = ?', 
  ["type" => "i", "value" => $userId], ["type" => "i", "value" => $sellerId]);
  if ($insertReview) {
    // User has already reviewed the seller 
    header('Location: /dashboard/products/review?error=leaveReview&seller=' . $sellerId);
  } else {
    // Insert review into database
    $insertReview = insert('INSERT INTO reviews (userid, stars, description, sellerid) VALUES (?, ?, ?, ?)', 
    ["type" => "i", "value" => $userId],
    ["type" => "i", "value" => $rating],
    ["type" => "s", "value" => $review],
    ["type" => "i", "value" => $sellerId]
  );
  header('Location: /dashboard/products/review?success=leaveReview&seller=' . $sellerId);
  }
} else {
  header('Location: /dashboard/products/review');
}
