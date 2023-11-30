<?php


require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];

// Fetch the purchase history for the user
// create a query that selects all orders from the orders table where userid and join the products table on productid
$query = "SELECT * FROM orders INNER JOIN products ON orders.productid = products.id WHERE buyerid = ?";
$purchaseHistory = fetchSingle(
  $query,
  ["type" => "i", "value" => $userId]
);

?>


<!-- BEGIN: Display Purchase History -->
<div class="p-4 overflow-x-auto">
  <h1 class="text-2xl font-bold mb-4">Purchase History</h1>
  <?php if (count($purchaseHistory) > 0) : ?>
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
        <?php foreach ($purchaseHistory as $purchase) : ?>
          <tr>
            <form action="/src/lib/user/member/factuur.php" method="post">
              <input type="hidden" name="productid" value="<?= $purchase['id'] ?>">
              <input type="hidden" name="deliveryMethod" value="<?= $purchase['deliverymethod'] ?>">
              <td><?= $purchase['name'] ?></td>
              <td><?= $purchase['price'] ?>€</td>
              <td><?= date('F j, Y', strtotime($purchase['createdAt']))
                  // This code is using the PHP `date()` function to format the `timeOfPurchase` value from an array called `$purchase`.
                  // The `strtotime()` function is used to convert the `timeOfPurchase` value into a Unix timestamp, which is a numeric representation of a date and time.
                  // The `date()` function is then used to format the Unix timestamp into a human-readable date format.

                  ?></td>
              <td>
                <a href="/catalog/product?id=<?= $purchase['productid'] ?>" class="btn btn-primary">View product page</a>
              </td>
              <td>
                <button name="history" class="btn btn-primary">
                  Download factuur
                </button>
              </td>
            </form>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  <?php else : ?>
    <p>You have not made any purchases yet.</p>
  <?php endif; ?>
</div>
<!-- END: Display Purchase History -->