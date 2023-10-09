<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php'; 
include_once LIB . '/catalog/products.php';

if(isset($_GET['id'])) {
    header('location: /catalog/products?id=' . $_GET["id"] . '');
}


?>