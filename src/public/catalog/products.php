<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = getAllProducts();

echo '
<div class="pl-24 pr-80 sm:pr-40 mx-auto pt-24 pb-40 flex flex-row gap-4 flex-wrap shadow-lg">
  <div class="flex-[.4] bg-neutral rounded-2xl">
  </div>
  <div class="divider divider-horizontal"></div> 
  <div class="flex flex-row flex-wrap gap-8 flex-[1.6]">
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

