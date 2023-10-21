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
  $insertReview = fetchSingle('SELECT * FROM review WHERE member = ? AND seller = ?', 
  ["type" => "i", "value" => $userId], ["type" => "i", "value" => $sellerId]);
  if ($insertReview) {
    // User has already reviewed the seller 
    header('Location: /dashboard/products/review?error=leaveReview&seller=' . $sellerId);
  } else {
    // Insert review into database
    $insertReview = insert('INSERT INTO review (member, review, sterren, seller, date) VALUES (?, ?, ?, ?, ?)', 
    ["type" => "i", "value" => $userId],
    ["type" => "s", "value" => $review],
    ["type" => "i", "value" => $rating],
    ["type" => "i", "value" => $sellerId],
    ["type" => "s", "value" => date('Y-m-d')] 
  );
  header('Location: /dashboard/products/review?success=leaveReview&seller=' . $sellerId);
  }
} else {
  header('Location: /dashboard/products/review');
}
