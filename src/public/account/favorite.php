
<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

if(isset($_POST['favo'])){
    echo "juaf";
}else{
    $userid = $_SESSION['user']['id'] ;
    $proid = $_GET["id"];
   
   $sql = insert("INSERT INTO favorieten (userid, id) VALUES ($userid, $proid)");
   
    $sql2 = fetch("SELECT name, price FROM products INNER JOIN favorieten ON(products.id = favorieten.id) WHERE favorieten.userid = '$userid'");
}




 
 


?>