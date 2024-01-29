<?php
if (!isset($_GET['productid'])) {
    header('location: /');
    exit();
}


if (!isset($_SESSION['user'])) {
    header('Location: /');
    exit();
}


require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

require_once('vendor/autoload.php');

$stripe = new \Stripe\StripeClient("sk_test_MgvkTWK1jRG3olSRx9B7Mmxo");

$product = $stripe->products->create([
  'name' => 'Starter Subscription',
  'description' => '$12/Month subscription',
]);

$price = $stripe->prices->create([
  'unit_amount' => 1200,
  'currency' => 'usd',
  'recurring' => ['interval' => 'month'],
  'product' => $product['id'],
]);

$productId = $_GET['productid'];

$query = 'SELECT COUNT(*) as aantal FROM orders WHERE productid = ?';
$delivery_data = fetch($query, ['type' => 'i', 'value' => $productId]);

$query = 'SELECT * FROM products WHERE id = ?';
$productData = fetch($query, ['type' => 'i', 'value' => $productId]);

$query = 'SELECT * FROM bids WHERE productid = ?';
$bidData = fetch($query, ['type' => 'i', 'value' => $productId]);

if (
    $delivery_data["aantal"] > 0 ||
    !isset($bidData["bidder"]) ||
    $bidData["bidder"] != $_SESSION['user']['id']
) {
    // echo '<script>window.location="../"</script>';
    exit();
}



?>

<h1 class="text-center text-4xl font-bold mb-12">Delivery order</h1>
<h2 class="text-center text-2xl font-bold mb-12">Product: <u>
        <?php echo $productData["name"] ?>
    </u></h2>

<form action="/src/lib/user/member/factuur.php" method="post" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
    <input type="hidden" name="productid" id="productid" value="<?php echo $_GET["productid"] ?>">

    <div class="flex flex-row justify-center gap-4 w-full">
        <div class="form-control flex-1 w-full">
            <label class="label">
                <span class="label-text">Delivery method</span>
            </label>
            <select name="deliveryMethod" class="select select-bordered w-full">
                <?php
                if ($productData["deliveryStandard"]) {
                    echo '<option value="Standard">Standard delivery</option>';
                }

                if ($productData["deliveryExpress"]) {
                    echo '<option value="Express">Express delivery</option>';
                }

                if ($productData["deliveryPickup"]) {
                    echo '<option value="Pickup">Pickup</option>';
                }
                ?>
            </select>
        </div>
    </div>

    <div class="form-control w-full max-w-xs mt-4">
        <button name="send" class="btn btn-primary">
            Receipt
        </button>
    </div>
</form>