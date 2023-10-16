<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = [];
if (isset($_GET['search'])) {
  $searchTerm = $_GET['search'];
  $query = "SELECT * FROM products WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)";
  $params = ['type' => 's', 'value' => "$searchTerm*"];
  
  if (isset($_GET['start_price']) && isset($_GET['end_price'])) {
    $start_price = $_GET['start_price'];
    $end_price = $_GET['end_price'];
    $query .= " AND price BETWEEN ? AND ?";
    // Add the types and values to the params array like this: "'type' => 'n'", "'value' => $var", add a new array for each parameter
    $products = fetch($query, $params, ['type' => 'i', 'value' => $start_price], ['type' => 'i', 'value' => $end_price] );
  } else {
    $products = fetch($query, $params);
  }
} else {
  if (isset($_GET['start_price']) && isset($_GET['end_price'])) {
    $start_price = $_GET['start_price'];
    $end_price = $_GET['end_price'];
    $query = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
    $products = fetch($query, ['type' => 'i', 'value' => $start_price], ['type' => 'i', 'value' => $end_price]);
  } else {
    $products = getAllProducts();
  }
}



echo '
<div class="w-full flex flex-col md:flex-row gap-4 p-8 md:pr-40">
  <div class="hidden md:block md:flex-[.4] bg-base-300 rounded-2xl">
  <div class="card-body"> 
  <form action="" method="get">
    <div class="row"> 
      <div class="col-md-4"> 
        <label for="">Start Price</label> 
        <input type="text" name="start_price" value="';
        if(isset($_GET['start_price'])) echo $_GET['start_price'];  else{echo'100';};
         echo'" class="form-control">  
      </div> 
      <div class="col-md-4"> 
        <label for="">End Price</label> 
        <input type="text" name="end_price" value="';
        if(isset($_GET['end_price'])) echo $_GET['end_price']; else{echo'900';}; 
         echo'"class="form-control"> 
      </div> 
      <br>
      <div class="col-md-4"> 
        <button class="btn btn-primary">Click Me</button>
      </div> 
    </div>
  </form>
  </div>
  </div>
  ';


// if(isset($_GET['start_price']) && isset($_GET['end_price']) && !empty($_GET['start_price']) && !empty($_GET['end_price'])){
//   $start_price = $_GET['start_price'];
//   $end_price = $_GET['end_price'];
//   $query = "SELECT * FROM products WHERE price BETWEEN $start_price AND $end_price";
//   $products = fetch($query);
  
// }
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

