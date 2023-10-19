<?php
if (!isset($_GET['id'])) {
  header('location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$productId = $_GET['id'];
$query = 'SELECT * FROM products WHERE id = ?';
$productData = fetch($query, ['type' => 'i', 'value' => $productId]);

$time = substr($productData['endDate'], 11, 5);

$query = 'SELECT * FROM users,user_profile
          WHERE users.id=user_profile.userid
          AND users.id = ?';
$sellerData = fetch($query, ['type' => 'i', 'value' => $productId]);
?>

<div class="w-full flex justify-center md:justify-start text-sm breadcrumbs">
  <ul>
    <li><a href="/">Home</a></li> 
    <li>Catalog</li>
    <li><a href="/catalog/products">All Products</a></li>
  </ul>
</div>
<div class="flex flex-col md:flex-row gap-4">
  <div class="flex-[1.3]">
    <img class="w-full h-full aspect-[3/2] rounded-2xl" src="/public/images/<?php echo $productData["imageUrl"]  ?>" alt="">
  </div>
  <div id="actions" class="flex flex-[.7] bg-base-100 rounded-2xl p-8 flex-col items-center justify-center">
    <?php
    if (strtotime($productData['endDate']) > time()) {
      echo '<p class="opacity-70 pb-12">Veiling sluit om ' . $time . '</p>';
    }
    ?>
    <div class="pb-24">
      <span id="countdown-wrapper" class="countdown font-mono text-5xl">
        <span id="hours" style="--value:00;"></span>:
        <span id="minutes" style="--value:00;"></span>:
        <span id="seconds" style="--value:00;"></span>
      </span>
      <div id="radial-progress" class="hidden radial-progress text-2xl" style="--value:100;">
        60
      </div>
    </div>
    <div class="flex flex-row justify-center gap-8 md:gap-24 pb-8">
      <div class="flex flex-col items-center">
        <p class="uppercase text-xs opacity-40 font-bold">Huidig bod</p>
        <p id="currentBid" class="font-semibold text-xl">€19</p>
      </div>
      
      <div class="flex flex-col items-center">
        <p class="uppercase text-xs opacity-40 font-bold">Adviesprijs</p>
        <p id="suggestedBid" class="font-semibold text-xl">€119</p>
      </div>
      
      <div class="flex flex-col items-center">
        <p class="uppercase text-xs opacity-40 font-bold">Bieders</p>
        <p id="bidders" class="font-semibold text-xl">0</p>
      </div>
    </div>
    <div class="join">
      <div class="relative">
        <input id="bidInput" type="number" min="1" step="0.01" placeholder="Your bid" class="input input-bordered w-full max-w-xs join-item pl-5 relative" />
        <p class="absolute top-3 left-2 opacity-40">€</p>
      </div>
      <button onclick="bid()" class="btn btn-outline btn-primary join-item">Place bid</button>
    </div>
  </div>
</div>

<div class="flex justify-center gap-4 mt-4">
  <div class="flex flex-col md:flex-[1.3] gap-4">
    <h1 class="text-2xl font-semibold"> <?php echo $productData['name']; ?></h1>
    <p> <?php echo $productData['description']; ?></p>
  </div>
  <div class="flex-[.7] p-8"></div>
</div>

<?php
//make a revieuw system of the product and make it so that u can only review once and that u can only review if u have bought the product and that the other people the revieuws  can see but not add to it if they havent bought the product

// Fetch seller information
$sellerId = $_GET['id'];
$userId = $_SESSION['user']['id'];



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



    <table class="table table-zebra w-full">
      <thead>
        <tr>
          <th>Rate the product</th>
        </tr>
      </thead>
      <tbody>
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
      </tbody>
    </table>
</div>



<!-- BEGIN: Display Product Reviews -->
<div class="p-4 overflow-x-auto">
  <h1 class="text-2xl font-bold mb-4">Product Reviews</h1>
  <?php if (count($sellerReviews) > 0): ?>
    <table class="table table-zebra w-full">
      <thead>
        <tr>
          <th>Rating</th>
          <th>Review</th>
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
    <p>This product has no reviews yet.</p>
  <?php endif; ?>
</div>
<!-- END: Display Product Reviews -->
<script>
  productCountdown("<?php echo $productData['endDate']; ?>")
</script>

