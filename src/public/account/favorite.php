
<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';


$userid = $_SESSION['user']['id'] ;
 $proid = $_GET["id"];

$sql = insert("INSERT INTO favorieten (userid, productsid) VALUES ($userid, $proid)");
$sql2 = "SELECT * FROM tblproducten"


 
 
// SELECT naam, id, userid 
// FROM products 
// INNER JOIN favorieten ON(products.userid = favorieten.userid)
// INNER JOIN favorieten ON (products.id = favorieten.productsid) 
// WHERE userid = 51;

?>