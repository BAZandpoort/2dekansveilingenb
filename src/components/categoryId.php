<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$categoryid = $_GET['categoryid'] ?? null;

if ($categoryid) {
  $products = fetch('SELECT * FROM products WHERE categoryid = ?', ['type' => 'i', 'value' => $categoryid]);
} else {
  // Handle the case when no category is selected, e.g., show all products.
  $products = getAllProducts();
}

// Output your HTML and product cards
echo '<div class="w-full flex flex-col md:flex-row gap-4 p-8 md:pr-40">';
echo '<div class="flex flex-row flex-wrap gap-8 flex-[1.6]">';

foreach ($products as $index => $product) {
  if ($index > 0 && $index % 4 === 0) {
    echo '</div><div class="flex flex-col md:flex-row flex-wrap justify-between gap-8">';
  }

  productCard($product, true);
}

echo '</div></div>';
?>
