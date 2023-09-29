<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
include_once LIB . '/catalog/products.php';

  
$userid = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;
$query = "SELECT * FROM products WHERE userid = ?";
$products = fetch($query, ['type' => 'i', 'value' => $userid]);

if (empty($products)){
    myProducts();
}else{
    echo"<h2>u hebt nog geen producten</h2>";
    print"test";
}
?>