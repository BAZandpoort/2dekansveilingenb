<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
include_once LIB . '/catalog/products.php';
include_once COMPONENTS . '/product-card.php';

$products = userProducts($userid);

echo '
<div class="flex flex-row flex-wrap gap-8 flex-[1.7]">
  <div class="flex flex-row flex-wrap justify-between gap-8">
';

$i = 0;
foreach ($products as $product) {

  echo '
  <div class="flex flex-col gap-4">
    <div class="w-96 flex flex-row flex-wrap justify-between gap-8">
  ';

  productCard($product);

  echo '
    </div>
  </div>
  ';

  $i++;
}
echo '
  </div>
</div>
';
