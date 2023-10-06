<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = getAllProducts();

echo '
<div class="flex flex-row gap-4">
  <div class="flex-[.3]">
  </div>
  <div class="divider divider-horizontal"></div> 
  <div class="flex flex-row flex-wrap gap-8 flex-[1.7]">
    <div class="flex flex-row flex-wrap justify-between gap-8">
';

foreach ($products as $index => $product) {
  if ($index > 0 && $index % 4 === 0) {
    echo '
      </div>
      <div class="flex flex-row flex-wrap justify-between gap-8">
    ';
  }

  productCard($product, true);
}

echo '
    </div>
  </div>
</div>
';
?>

