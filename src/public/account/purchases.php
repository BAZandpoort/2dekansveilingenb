<?php
  if (!isset($_SESSION['user'])) {
    header('Location: /');
    exit();
  }

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];
$purchaseHistory = fetch('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);

if (!$purchaseHistory) {
  $purchaseHistory = [];
}

$purchases = [];

foreach ($purchaseHistory as $purchase) {
  $productId = $purchase['productId'];
  $product = fetch('SELECT * FROM products WHERE id = ?', ["type" => "i", "value" => $productId]);
  $purchases[] = [
    'productName' => $product['name'],
    'price' => $product['price'],
    'timeOfPurchase' => $purchase['timeOfPurchase'],
  ];
}

?>

<?php var_dump($purchases) ?>
<!-- BEGIN: Display Purchase History -->
<div class="p-4">
  <h1 class="text-2xl font-bold mb-4">Purchase History</h1>
  <?php if (count($$purchases) > 0): ?>
    <table class="table w-full">
      <thead>
        <tr>
          <th>Item Name</th>
          <th>Price</th>
          <th>Date Purchased</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($purchases as $purchase): ?>
          <tr>
            <td><?= $purchase['productName'] ?></td>
            <td><?= $purchase['price'] ?></td>
            <td><?= date('F j, Y', strtotime($purchase['timeOfPurchase'])) ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  <?php else: ?>
    <p>You have not made any purchases yet.</p>
  <?php endif; ?>
</div>
<!-- END: Display Purchase History -->

