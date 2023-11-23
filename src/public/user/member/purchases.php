<?php
  

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];

// Fetch the purchase history for the user
$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);

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
          <th>factuur</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($purchaseHistory as $purchase): ?>
          <tr>
            <td><?= $purchase['productName'] ?></td>
            <td><?= $purchase['price'] ?>€</td>
            <td><?= date('F j, Y', strtotime($purchase['timeOfPurchase'])) 
            // This code is using the PHP `date()` function to format the `timeOfPurchase` value from an array called `$purchase`.
// The `strtotime()` function is used to convert the `timeOfPurchase` value into a Unix timestamp, which is a numeric representation of a date and time.
// The `date()` function is then used to format the Unix timestamp into a human-readable date format.
          
            ?></td>
            <td>
              <a href="/catalog/product?id=<?= $purchase['productId'] ?>" class="btn btn-primary">View product page</a>
            </td>   
            <td>
              <a href="/src/lib/user/member/factuur.php" class="btn btn-primary">Download factuur</a>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
    <?php else: ?>
      <p>You have not made any purchases yet.</p>
    <?php endif; ?>
</div>
<!-- END: Display Purchase History -->






