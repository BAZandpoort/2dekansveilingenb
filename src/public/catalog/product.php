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
$ended = strtotime($productData['endDate']) < time();

$time = substr($productData['endDate'], 0, 16);


$query = 'SELECT * FROM users,user_profile
          WHERE users.id=user_profile.userid
          AND users.id = ?';
$sellerData = fetch($query, ['type' => 'i', 'value' => $productId]);

if (isset($_SESSION["user"])) {
  $query = "SELECT *, COUNT(*) AS amount FROM bids WHERE productid = ? AND userid = ?";
  $bidData = fetch($query, ["type" => "i", "value" => $productId], ["type" => "i", "value" => $_SESSION["user"]["id"]]);
  $lastBid = ($bidData["amount"] > 0) ? $bidData["bidPrice"] : 0.00;
} else {
  $lastBid = 0;

}
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
    <img class="w-full h-full aspect-[3/2] rounded-2xl object-cover" src="/public/images/<?php echo $productData["imageUrl"]  ?>" alt="">
  </div>
  <div id="actions" class="flex flex-[.7] bg-base-100 rounded-2xl p-8 flex-col items-center justify-center">
    <?php
    if (strtotime($productData['endDate'])) {
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
        <p id="currentBid" class="font-semibold text-xl">€
          <?= $lastBid ?>
        </p>
      </div>

      <div class="flex flex-col items-center">
        <p class="uppercase text-xs opacity-40 font-bold">Adviesprijs</p>
        <p id="suggestedBid" class="font-semibold text-xl">€
          <?= $productData["price"] ?>
        </p>
      </div>
    </div>
    <?php
    if (isset($_SESSION['user']) && !$ended) {
      echo '
          <form action="/src/lib/catalog/bid.php" method="post">
          <input type="hidden" name="productid" value="' . $productId . '">
            <div class="join">
              <div class="relative">
                <input name="amount" type="number" min="' . $lastBid + 0.01 . '" step="0.01" placeholder="Your bid" class="input input-bordered w-full max-w-xs join-item pl-5 relative" required/>
                <p class="absolute top-3 left-2 opacity-40">€</p>
              </div>
              <button name="bid" class="btn btn-outline btn-primary join-item">Place bid</button>
            </div>
          </form>
        ';
    } else {
      if ($ended) {
        $finalBid = fetch('SELECT * FROM successful_bids WHERE  productid = ?', ['type' => 'i', 'value' => $productId]);
        if (!isset($finalBid["bidPrice"])) {
          $finalBidMessage = "Auction ended with no bids";
          echo '<p class="text-center text-xl font-semibold">' . $finalBidMessage . '</p>';
        } else {
          $finalBidMessage = 'Winning bid was: €' . $finalBid["bidPrice"] . '';
          echo '<p class="text-center text-xl font-semibold">' . $finalBidMessage . '</p>';

          if ($finalBid['bidderid'] == $_SESSION['user']['id']) {

            $query = 'SELECT COUNT(*) as aantal FROM delivery_orders WHERE productid = ?';
            $delivery_data = fetch($query, ['type' => 'i', 'value' => $productId]);
            if ($delivery_data["aantal"] > 0) {
              echo '-<button class="btn btn-outline btn-warning">Delivery already made</button>';
            } else {
              echo '
                <a href="/catalog/delivery_order?productid=' . $productId . '"><button class="btn btn-outline btn-success">Order delivery</button></a>
              ';
            }
          }
        }
      } else {
        echo '
          <a href="/account/login" class="btn btn-primary">
            Log in to begin bidding
          </a>';
      }
    }
    ?>

    <br>
    <?php

    // Retrieve the highest bidder
    $sql = "SELECT userid, bidPrice FROM bids WHERE productid = ? ORDER BY bidOfferedAt DESC LIMIT 1";
    $stmt = $connection->prepare($sql); // Prepare the SQL statement
    $stmt->bind_param("i", $productId); // Bind the product ID parameter = binding parameters is a way of preventing SQL injection
    $stmt->execute(); // Execute the SQL statement
    $result = $stmt->get_result(); // Get the result set
    $lastBid = $result->fetch_assoc(); // Fetch the highest bidder data
    $lastBidderId = $lastBid ? $lastBid['userid'] : null; // Get the highest bidder's user ID
    $lastBidPrice = $lastBid ? $lastBid['bidPrice'] : null; // Get the highest bid price if it isnt show null = it means that it does not currently hold any value

    // Check if the auction has ended
    $ended = strtotime($productData['endDate']) < time(); // Check if the end date of the auction has passed
    $isWinningBidder = $lastBidderId ? ($lastBidderId === $_SESSION["user"]["id"]) : false; // Check if the current user is the winning bidder
    if ($ended) {
      if (isset($_SESSION["user"])) {
        // Check if the user is the winning bidder
        $isWinningBidder = ($lastBidderId === $_SESSION["user"]["id"]);
        if ($isWinningBidder) {
          echo '
            <form action="/src/lib/user/member/factuur.php" method="post">
              <input type="hidden" name="product_id" value="' . $productId . '">
              <input type="hidden" name="amount" value="' . ($lastBidPrice ? $lastBidPrice : '') . '">
              <button class="btn btn-primary mb-3">Pay Now</button>
            </form>
          ';
        }
      }
    }
    ?>
      
<br>

    <?php

    // Retrieve the highest bidder
    $sql = "SELECT userid, bidPrice FROM bids WHERE productid = ? ORDER BY bidOfferedAt DESC LIMIT 1";
    $stmt = $connection->prepare($sql); // Prepare the SQL statement
    $stmt->bind_param("i", $productId); // Bind the product ID parameter = binding parameters is a way of preventing SQL injection
    $stmt->execute(); // Execute the SQL statement
    $result = $stmt->get_result(); // Get the result set
    $lastBid = $result->fetch_assoc(); // Fetch the highest bidder data
    $lastBidderId = $lastBid ? $lastBid['userid'] : null; // Get the highest bidder's user ID
    $lastBidPrice = $lastBid ? $lastBid['bidPrice'] : null; // Get the highest bid price if it isnt show null = it means that it does not currently hold any value

    // Check if the auction has ended
    $ended = strtotime($productData['endDate']) < time(); // Check if the end date of the auction has passed
    $isWinningBidder = $lastBidderId ? ($lastBidderId === $_SESSION["user"]["id"]) : false; // Check if the current user is the winning bidder
    if ($ended) {
      if (isset($_SESSION["user"])) {
        // Check if the user is the winning bidder
        $isWinningBidder = ($lastBidderId === $_SESSION["user"]["id"]);
        if ($isWinningBidder) {
          echo '
            <form action="/src/lib/user/member/factuur.php" method="post">
              <input type="hidden" name="product_id" value="' . $productId . '">
              <input type="hidden" name="amount" value="' . ($lastBidPrice ? $lastBidPrice : '') . '">
              <button class="btn btn-primary mb-3">Pay Now</button>
            </form>
          ';
        }
      }
    }
    ?>
      
<br>

    <?php
    if ($productData["supportStandard"]) {
      $emojiSD = "✔️";
    } else {
      $emojiSD = "❌";
    }

    if ($productData["supportExpress"]) {
      $emojiED = "✔️";
    } else {
      $emojiED = "❌";
    }

    if ($productData["supportPickup"]) {
      $emojiPU = "✔️";
    } else {
      $emojiPU = "❌";
    }

    echo '<b>Beschikbare verzendopties</b>
        <table>
          <tr>
            <td>Standard</td>
            <td>' . $emojiSD . '</td>
          </tr>
          <tr>
            <td>Express</td>
            <td>' . $emojiED . '</td>
          </tr>
          <tr>
            <td>Pickup</td>
            <td>' . $emojiPU . '</td>
          </tr>
        </table>
        <br><br>
      ';

    if (isset($_SESSION["user"])) {
      
      echo '
          <a href="/catalog/report?productid=' . $productId . '"><button class="btn btn-outline btn-error">Report abuse</button></a>
        ';
    } else {
      echo '
          <button class="btn btn-outline btn-error" onclick="my_modal_2.showModal()">Report abuse</button>
          <dialog id="my_modal_2" class="modal">
            <div class="modal-box">
              <h3 class="font-bold text-lg">Account required for this action</h3>
              <p class="py-4"><a href="/account/login"><b><u>Log in</u></b></a> to report abuse</p>
            </div>
            <form method="dialog" class="modal-backdrop">
              <button>close</button>
            </form>
          </dialog>
        ';
    }


    ?>

  </div>
</div>

<div class="flex justify-center gap-4 mt-4">
  <div class="flex flex-col md:flex-[1.3] gap-4">
    <h1 class="text-2xl font-semibold">
      <?php echo $productData['name']; ?>
    </h1>
    <p>
      <?php echo $productData['description']; ?>
    </p>
    <br>
  </div>
  <div class="flex-[.7] p-8"></div>
</div>

<?php
//make a revieuw system of the product and make it so that u can only review once and that u can only review if u have bought the product and that the other people the revieuws  can see but not add to it if they havent bought the product

// Fetch seller information
$sellerId = $_GET['id'];
$userId = $_SESSION['user']['id'];

// Check if user has bought the product
$hasBoughtProduct = false;
$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);
foreach ($purchaseHistory as $purchase) {
  if ($purchase['productId'] == $sellerId) {
    $hasBoughtProduct = true;
    break;
  }
}

$sellerInfo = fetchSingle('SELECT * FROM users WHERE id = ?', ["type" => "i", "value" => $sellerId]);
// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (!$hasBoughtProduct) {
    // User has not bought the product
    $errorMessage = "You can only review a product that you have bought.";
  } else {
    $review = $_POST['review'];
    $rating = $_POST['rating'];

    // Check if user has already reviewed the seller
    $insertReview = fetchSingle(
      'SELECT * FROM review WHERE member = ? AND seller = ?',
      ["type" => "i", "value" => $userId],
      ["type" => "i", "value" => $sellerId]
    );
    if ($insertReview) {
      // User has already reviewed the seller
      $errorMessage = "You have already reviewed this seller.";
    } else {
      // Insert review into database
      $insertReview = insert(
        'INSERT INTO review (member, review, sterren, seller, date) VALUES (?, ?, ?, ?, ?)',
        ["type" => "i", "value" => $userId],
        ["type" => "s", "value" => $review],
        ["type" => "i", "value" => $rating],
        ["type" => "i", "value" => $sellerId],
        ["type" => "s", "value" => date('Y-m-d')]
      );
    }
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


<div class="flex flex-col">
  <h1 class="text-2xl font-bold mb-4">Rate the product</h1>
  <?php if (!$hasBoughtProduct): ?>
    <p>You can only review a product that you have bought.</p>
  <?php else: ?>
    <form method="POST" class="flex flex-col gap-4">
      <div class="rating rating-lg flex gap-4">
        <input type="radio" name="rating" value="1" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating" value="2" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating" value="3" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating" value="4" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating" value="5" class="mask mask-star-2 bg-orange-400" checked />
      </div>
      <textarea name="review" class="textarea textarea-success" placeholder="Leave a review"></textarea>
      <?php if (isset($errorMessage)): ?>
        <p class="text-red-500">
          <?= $errorMessage ?>
        </p>
      <?php else: ?>
        <button type="submit" class="btn btn-outline btn-warning">Submit Review</button>
      <?php endif; ?>
    </form>
  <?php endif; ?>
</div>

<div class="flex flex-col">
  <h1 class="text-2xl font-bold mb-4">Product Reviews</h1>
  <?php if (count($sellerReviews) > 0): ?>
    <p>Average Rating:
      <?= number_format($averageRating, 1) ?>
    </p>
    <div class="flex flex-col gap-4">
      <?php foreach ($sellerReviews as $review): ?>
        <div class="border border-gray-300 p-4">
          <p class="font-bold">
            <?= $review['review'] ?>
          </p>
          <p>
            <?= $review['sterren'] ?>
          </p>
          <p>
            <?= date('F j, Y', strtotime($review['date'])) ?>
          </p>
        </div>
      <?php endforeach; ?>
    </div>
  <?php else: ?>
    <p>This product has no reviews yet.</p>
  <?php endif; ?>
</div>






<form action="/src/lib/user/seller/update-timer.php" method="post" enctype="multipart/form-data"
  class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Auction End Date -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Auction End Date</span>
      </label>
      <input type="datetime-local" name="endDate" placeholder="20.00" class="input input-bordered w-full" required />
      <input type="hidden" name="id" value="<?php echo $productData['id']; ?>" />
    </div>
  </div>
  <div class="form-control w-full max-w-xs mt-4">
    <button name="change" class="btn btn-primary">change</button>
  </div>
</form>


<script>
  productCountdown("<?php echo $productData['endDate']; ?>")
</script>