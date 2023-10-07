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

<div class="flex flex-row gap-4">
  <div class="flex-[1.3] rounded-2xl overflow-clip">
    <img class="w-full h-full aspect-[3/2]" src="/public/images/1.jpg" alt="">
  </div>
  <div id="actions" class="flex flex-[.7] bg-neutral rounded-2xl p-8 flex-col items-center justify-center">
    <p class="opacity-70 pb-12">Veiling sluit om <?php echo $time; ?></p>
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
    <div class="flex flex-row justify-center gap-24 pb-8">
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
  <div class="flex flex-col flex-[1.3] gap-4">
    <h1 class="text-2xl font-semibold"> <?php echo $productData['name']; ?></h1>
    <p> <?php echo $productData['description']; ?></p>
  </div>
  <div class="flex-[.7] p-8"></div>
</div>

<script>
  productCountdown("<?php echo $productData['endDate']; ?>")
</script>
