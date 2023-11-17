<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = []; // Initialize an empty array to store the products
$categoryname = $_GET['category'] ?? null; // Get the value of the 'category' parameter from the URL query string, if it exists

if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id']; // Fetch the category ID from the 'product_categories' table based on the category name
  $minPrice = fetchSingle('SELECT MIN(price) FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId])[0]['MIN(price)']; // Fetch the minimum price of products in the specified category
} else {
  $minPrice = fetchSingle('SELECT MIN(price) FROM products')[0]['MIN(price)']; // Fetch the overall minimum price of all products
}

if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id']; // Fetch the category ID from the 'product_categories' table based on the category name
  $maxPrice = fetchSingle('SELECT MAX(price) FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId])[0]['MAX(price)']; // Fetch the maximum price of products in the specified category
} else {
  $maxPrice = fetchSingle('SELECT MAX(price) FROM products')[0]['MAX(price)']; // Fetch the overall maximum price of all products
}

if (isset($_GET['search'])) {
  $searchTerm = $_GET['search']; // Get the value of the 'search' parameter from the URL query string
  $query = "SELECT * FROM products WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)"; // Construct a full-text search query to search for products based on name and description
  $products = fetchSingle($query, ['type' => 's', 'value' => "$searchTerm*"]); // Fetch the products matching the search term
} else if (isset($_GET['minPrice']) && isset($_GET['maxPrice'])) {
  $query = "SELECT * FROM products WHERE price BETWEEN ? AND ?"; // Construct a query to fetch products within a price range
  $products = fetchSingle($query, ['type' => 'i', 'value' => $_GET['minPrice']], ['type' => 'i', 'value' => $_GET['maxPrice']]); // Fetch the products within the specified price range
} else if ($categoryname) {
  $categoryId = fetchSingle('SELECT * FROM product_categories WHERE name = ?', ['type' => 's', 'value' => $categoryname])[0]['id']; // Fetch the category ID from the 'product_categories' table based on the category name
  $products = fetchSingle('SELECT * FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryId]); // Fetch the products belonging to the specified category
} else {
  $products = getAllProducts(); // Fetch all products
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
