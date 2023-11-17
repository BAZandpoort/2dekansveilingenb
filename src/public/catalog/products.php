<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = [];
$categoryname = $_GET['category'] ?? null;

if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id'];
  $minPrice = fetchSingle('SELECT MIN(price) FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId])[0]['MIN(price)'];
} else {
  $minPrice = fetchSingle('SELECT MIN(price) FROM products')[0]['MIN(price)'];
}
if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id'];
  $maxPrice = fetchSingle('SELECT MAX(price) FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId])[0]['MAX(price)'];
} else {
  $maxPrice = fetchSingle('SELECT MAX(price) FROM products')[0]['MAX(price)'];
}

if (isset($_GET['search'])) {
  $searchTerm = $_GET['search'];
  $query = "SELECT * FROM products WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)";
  $products = fetchSingle($query, ['type' => 's', 'value' => "$searchTerm*"]);

} else if (isset($_GET['minPrice']) && isset($_GET['maxPrice'])) {
  $query = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
  $products = fetchSingle($query, ['type' => 'i', 'value' => $_GET['minPrice']], ['type' => 'i', 'value' => $_GET['maxPrice']]);
} else if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id'];
  $products = fetchSingle('SELECT * FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId]);
} else {
  $products = getAllProducts();
}

echo '
<div class="w-full flex flex-col md:flex-row gap-4 p-8 md:pr-40">
  <div class="hidden md:block md:flex-[.4] h-fit bg-base-300 py-8 rounded-2xl">
    <div>
      <form method="get" class="flex flex-col px-4 gap-8">
        <div class="flex flex-col gap-4">
          <div class="form-control w-full max-w-xs">
            <label class="label">
              <span id="priceMinLabel" class="label-text">€' . $minPrice . '</span>
            </label>
            <div class="form-control w-full max-w-xs">  
              <input id="priceMin" name="minPrice" type="range" min="' . $minPrice . '" max="' . $maxPrice . '" value="' . $minPrice . '" class="range range-accent" />
            </div>
          <div class="form-control w-full max-w-xs">
            <label class="label">
              <span id="priceMaxLabel" class="label-text">€' . $maxPrice . '</span>
            </label>
            </div>
            <div class="form-control w-full max-w-xs">
              <input id="priceMax" name="maxPrice" type="range" min="0" max="' . $maxPrice . '" value="' . $maxPrice . '" class="range range-accent" />
            </div>
          </div>
        </div>

        <button class="btn btn-primary">Filter</button>
      </form>
    </div>
  </div>
  ';

  echo '
  <div class="hidden md:flex divider divider-horizontal"></div> 

  <div class="flex flex-row flex-wrap gap-8 flex-[1.6]">
    <div class="w-full flex text-sm breadcrumbs">
      <ul>
        <li><a href="/">Home</a></li> 
        <li>Catalog</li>
        <li><a href="/catalog/products">All Products</a></li>
      </ul>
    </div>
    
    <div class="flex flex-wrap justify-between gap-8">
';

foreach ($products as $index => $product) {
  if ($index > 0 && $index % 4 === 0) {
    echo '
      </div>
      <div class="flex flex-col md:flex-row flex-wrap justify-between gap-8">
    ';
  }

  productCard($product, true);
  
}

echo '
  </div>
</div>
';
?>

<script defer>
  const rangeOne = document.getElementById('priceMin');
  const rangeTwo = document.getElementById('priceMax');

  const rangeOneLabel = document.getElementById('priceMinLabel');
  const rangeTwoLabel = document.getElementById('priceMaxLabel');

  rangeOne.addEventListener('input', (e) => {
    rangeOneLabel.textContent = `€${e.target.value}`;
  });

  rangeTwo.addEventListener('input', (e) => {
    rangeTwoLabel.textContent = `€${e.target.value}`;
  });
</script>
