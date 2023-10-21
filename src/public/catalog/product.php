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

if (isset($_SESSION["user"])){
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
    <img class="w-full h-full aspect-[3/2] rounded-2xl" src="/public/images/<?php echo $productData["imageUrl"]  ?>" alt="">
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
        <p id="currentBid" class="font-semibold text-xl">€ <?= $lastBid ?></p>
      </div>
      
      <div class="flex flex-col items-center">
        <p class="uppercase text-xs opacity-40 font-bold">Adviesprijs</p>
        <p id="suggestedBid" class="font-semibold text-xl">€ <?= $productData["price"]?></p>
      </div>
    </div>
    <?php
      if (isset($_SESSION['user']) && !$ended) {
        echo '
          <form action="/src/lib/catalog/bid.php" method="post">
            <div class="join">
              <div class="relative">
                <input type="hidden" name="productid" value="'.$productId.'">
                <input name="amount" type="number" min="' . $lastBid + 0.01 . '" step="0.01" placeholder="Your bid" class="input input-bordered w-full max-w-xs join-item pl-5 relative" required/>
                <p class="absolute top-3 left-2 opacity-40">€</p>
              </div>
              <button name="bid" class="btn btn-outline btn-primary join-item">Place bid</button>
            </div>
          </form>
        ';
      } else {
        if ($ended) {
          echo '<p class="text-center text-xl font-semibold">Winning bid was: €' . $lastBid . '</p>';
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
      if (isset($_SESSION["user"])){
        echo '
          <a href="/catalog/report?productid='.$productId.'"><button class="btn btn-outline btn-error">Report abuse</button></a>
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
    <h1 class="text-2xl font-semibold"> <?php echo $productData['name']; ?></h1>
    <p> <?php echo $productData['description']; ?></p>
  </div>
  <div class="flex-[.7] p-8"></div>
</div>



<form action="/src/public/user/admin/update_timer.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
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