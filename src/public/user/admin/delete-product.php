<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';

if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

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
?>
<form action="/dashboard/products/delete" method="get" class="flex flex-row justify-center gap-4">
  <div class="form-control w-full max-w-xs">
    <input type="text" name="search" placeholder="Search" class="input input-primary input-bordered">
  </div>
  <button class="btn btn-primary">Search</button>
</form>






<?php 
/*
  This code block checks if a search term is set in the GET request. If it is, it searches
  for products that match the search term using a full-text search query. 
  If not, it retrieves all products from the database.
 @param string $_GET['search'] The search term to be used in the full-text search query.
  @return array The products that match the search term (if provided) or all products (if not provided).
 */
if (isset($_GET['search'])) {
  $searchTerm = $_GET['search'];
  $query = "SELECT * FROM products WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)";
  $products = fetchSingle($query, ['type' => 's', 'value' => "$searchTerm*"]);
} else {
  $products = getAllProducts();
}
foreach ($products as $product) {
  echo '
  <div class="card card-side bg-base-100 shadow-sm max-h-48">
    <figure class="max-w-sm">
      <img src="/public/images/' . $product['image'] . '" alt="Movie"/>
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
echo '
</div>
';
?>