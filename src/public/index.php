<?php
include_once LIB . '/catalog/products.php';
include_once COMPONENTS . '/product-card.php';

$categories = popularCategories(3);

echo '
<div class="flex flex-col gap-24">
';

$i = 0;
foreach ($categories as $category) {
  $categoryName = array_keys($categories)[$i];

  echo '
  <div class="flex flex-col gap-4">
    <p class="text-3xl font-bold">' .
    $categoryName .
    '</p>
    <div class="w-full flex flex-row flex-wrap justify-between gap-8">
  ';

  foreach ($category as $product) {
    productCard($product);
  }

  echo '
    </div>
  </div>
  ';

  $i++;
}

echo '</div>';
?>
