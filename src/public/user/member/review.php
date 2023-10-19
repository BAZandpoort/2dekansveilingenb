<?php
  

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];

$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);

// Fetch seller information
$sellerId = $_GET['seller'];


$sellerInfo = fetchSingle('SELECT * FROM users WHERE id = ?', ["type" => "i", "value" => $sellerId]);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $review = $_POST['review'];
  $rating = $_POST['rating'];

  // Check if user has already reviewed the seller
  $insertReview = fetchSingle('SELECT * FROM review WHERE member = ? AND seller = ?', 
  ["type" => "i", "value" => $userId], ["type" => "i", "value" => $sellerId]);
  if ($insertReview) {
    // User has already reviewed the seller
    $errorMessage = "You have already reviewed this seller.";
  } else {
    // Insert review into database
    $insertReview = insert('INSERT INTO review (member, review, sterren, seller, date) VALUES (?, ?, ?, ?, ?)', 
    ["type" => "i", "value" => $userId],
    ["type" => "s", "value" => $review],
    ["type" => "i", "value" => $rating],
    ["type" => "i", "value" => $sellerId],
    ["type" => "s", "value" => date('Y-m-d')]
  );
  }
}

// Fetch seller reviews
$sellerReviews = fetchSingle('SELECT * FROM review WHERE seller = ?', ["type" => "i", "value" => $sellerId]);
// Calculate average rating
$averageRating = 0;
if (count($sellerReviews) > 0) {
  foreach ($sellerReviews as $review) {
    $averageRating += $review['sterren'];
  }
  $averageRating /= count($sellerReviews);
}

?>


 <!-- BEGIN: Display Purchase History -->
 <div class="p-4 overflow-x-auto">
  <h1 class="text-2xl font-bold mb-4">Purchase History</h1>
  <?php if (count($purchaseHistory) > 0): ?>
    <table class="table table-zebra w-full">
      <thead>
        <tr>
          <th>Item Name</th>
          <th>Price</th>
          <th>Date Purchased</th>
          <th>product</th>
          <th>Rate the transaction</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($purchaseHistory as $purchase): ?>
          <tr>
            <td><?= $purchase['productName'] ?></td>
            <td><?= $purchase['price'] ?>€</td>
            <td><?= date('F j, Y', strtotime($purchase['timeOfPurchase'])) ?></td>
            <td>
              <a href="/catalog/product?id=<?= $purchase['productId'] ?>" class="btn btn-primary">View product page</a>
            </td>
            <td>
              <form method="POST">
                <div class="rating rating-lg">
                  <input type="radio" name="rating" value="1" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating" value="2" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating" value="3" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating" value="4" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating" value="5" class="mask mask-star-2 bg-orange-400" checked />
                  <textarea name="review" class="form-control" placeholder="Leave a review"></textarea>
                  <?php if (isset($errorMessage)): ?>
                    <p class="text-red-500"><?= $errorMessage ?></p>
                  <?php else: ?>
                    <button type="submit" class="btn btn-outline btn-warning">Submit Review</button>
                  <?php endif; ?>
                </div>
              </form>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
    <?php else: ?>
      <p>You have not made any purchases yet.</p>
    <?php endif; ?>
</div>

<!-- BEGIN: Display Seller Reviews -->
<div class="p-4 overflow-x-auto">
  <h1 class="text-2xl font-bold mb-4">Seller Reviews</h1>
  <?php if (count($sellerReviews) > 0): ?>
    <p>Average Rating: <?= number_format($averageRating, 1) ?></p>
    <table class="table table-zebra w-full">
      <thead>
        <tr>
          <th>Review</th>
          <th>Rating</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($sellerReviews as $review): ?>
          <tr>
            <td><?= $review['review'] ?></td>
            <td><?= $review['sterren'] ?></td>
            <td><?= date('F j, Y', strtotime($review['date'])) ?></td>
          </tr>
        <?php endforeach; ?>  
      </tbody>
    </table>
  <?php else: ?>
    <p>This seller has no reviews yet.</p>
  <?php endif; ?>
</div>
<!-- END: Display Seller Reviews -->