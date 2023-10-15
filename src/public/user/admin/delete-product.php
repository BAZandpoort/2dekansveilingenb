<?php
if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once LIB . '/util/util.php';

?>

<?php

$products = getAllProducts(); 



if (!$products) {
  echo '
  <div class="flex flex-col items-center justify-center gap-4">
    <h1 class="text-4xl font-bold">You have no products</h1>
    <a href="/dashboard/products/add" class="btn btn-primary">Add Product</a>
  </div>
  ';
  exit();
}

echo '
<div class="flex flex-col gap-8">
';

foreach ($products as $product) {
  echo '
  <div class="card card-side bg-base-100 shadow-sm max-h-48">
    <figure class="max-w-sm">
      <img src="/public/images/' . $product['imageUrl'] . '" alt="Movie"/>
    </figure>
    <div class="card-body">
      <h2 class="card-title">' . $product['name'] . '</h2>
      <p>' . $product['description'] . '</p>
      <div class="card-actions justify-between items-center">
        <p class="text-xl text-left font-bold">€' . $product["price"] . '</p>
        <div class="flex flex-row gap-2">
          <a href="/catalog/product?id=' . $product['id'] . '" class="btn btn-primary">bekijk product pagina</a>
          <form action="/src/lib/user/admin/delete-product.php" method="post" class="flex flex-col items-center gap-4">
                <input type="text" name="productid" value="' . $product['id'] . '" hidden>          
          <label for="productid" hidden>product ID</label>
          <button ?id=' . $product['id'] . '" class="btn btn-error">Verwijderen</a>
  </form>
        </div>
      </div>
    </div>
  </div>
  ';
}
//vardump button

echo '

</div>
';
?>