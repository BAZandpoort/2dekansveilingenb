<?php
  

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

// Get the user ID from the session
$userId = $_SESSION['user']['id'];

// Fetch the purchase history of the user
$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);

// Get the seller ID from the URL parameter
$sellerId = $_GET['seller'];

// Fetch the seller information
$sellerInfo = fetchSingle('SELECT * FROM users WHERE id = ?', ["type" => "i", "value" => $sellerId]);

// Fetch the seller reviews
$sellerReviews = fetchSingle('SELECT * FROM review WHERE seller = ?', ["type" => "i", "value" => $sellerId]);

// Calculate the average rating of the seller
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
  <h1 class="text-2xl font-bold mb-4">Leave a review</h1>
  <?php if (count($purchaseHistory) > 0): ?>
    <div class="grid grid-cols-5 gap-4">
      <?php foreach ($purchaseHistory as $purchase): ?>
        <div>
          <a href="/catalog/product?id=<?= $purchase['productId'] ?>" class="btn btn-primary">View product page</a>
        </div>
        <div>
          <form method="POST" action="/src/lib/user/member/add-review.php">
            <div class="rating rating-lg">
              <input type="radio" name="rating" value="1" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating" value="2" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating" value="3" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating" value="4" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating" value="5" class="mask mask-star-2 bg-orange-400" checked />
              <input type="hidden" name="seller" value="<?= $sellerId ?>" />
              <textarea name= "review" class="textarea textarea-success" placeholder="Leave a review"></textarea>
              <!-- <?php if ($errorMessage): ?>
                <p class="text-red-500"><?= $errorMessage ?></p>
              <?php else: ?> -->
                <button type="submit" class="btn btn-outline btn-warning">Submit Review</button>
              <?php endif; ?>
            </div>
          </form>
        </div>
      <?php endforeach; ?>
    </div>
    <?php else: ?>
      <p>You have not made any purchases yet.</p>
    <?php endif; ?>
</div>

<!-- BEGIN: Display Seller Reviews -->

<div class="p-4 overflow-x-auto">
  <h1 class="text-2xl font-bold mb-4">Seller Reviews</h1>
  <?php if (count($sellerReviews) > 0): ?>
    <p>Average Rating: <?= number_format($averageRating, 1) ?></p>
    <div class="grid grid-cols-3 gap-4">
      <div class="font-bold">Review</div>  
      <div class="font-bold">Rating</div> 
      <div class="font-bold">Date</div> 
      <?php foreach ($sellerReviews as $review): ?>
        <div><?= $review['review'] ?></div> 
        <div><?= $review['sterren'] ?></div> 
        <div><?= date('F j, Y', strtotime($review['date'])) ?></div> 
      <?php endforeach; ?>  
    </div>
  <?php else: ?>
    <p>This seller has no reviews yet.</p> 
  <?php endif; ?>
</div>
<!-- END: Display Seller Reviews -->