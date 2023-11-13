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

$productId = $_GET['productid'];
$query = 'SELECT * FROM products WHERE id = ?';
$productData = fetch($query, ['type' => 'i', 'value' => $productId]);

$query = 'SELECT * FROM successful_bids WHERE productid = ?';
$bidData = fetch($query, ['type' => 'i', 'value' => $productId]);

if ($bidData["bidderid"] != $_SESSION['user']['id'] || !isset($bidData["bidderid"])) {
    header('Location: /');
    exit();
}

$deliveryOptionsList = "";

if ($productData["supportStandard"]) {
    $deliveryOptionsList += '<option value="Standard">Standard delivery</option>';
}

if ($productData["supportExpress"]) {
    $deliveryOptionsList += '<option value="Express">Express delivery</option>';
}

if ($productData["supportPickup"]) {
    $deliveryOptionsList += '<option value="Pickup">Pickup</option>';
}
?>

<h1 class="text-center text-4xl font-bold mb-12">Delivery order</h1>
<h2 class="text-center text-2xl font-bold mb-12">Product: <u>
        <?php echo $productData["name"] ?>
    </u></h2>

<form action="/src/lib/user/member/delivery_order.php" method="post"
    class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
    <input type="hidden" name="productid" id="productid" value="<?php echo $_GET["productid"] ?>">

    <div class="flex flex-row justify-center gap-4 w-full">
        <div class="form-control flex-1 w-full">
            <label class="label">
                <span class="label-text">Delivery method</span>
            </label>
            <select name="deliveryMethod" class="select select-bordered w-full">
                <?php echo $deliveryOptionsList?>
            </select>
        </div>
    </div>

    <div class="form-control w-full max-w-xs mt-4">
        <button name="send" class="btn btn-primary">Send</button>
    </div>
</form>