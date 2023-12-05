<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

session_start();

if(isset($_POST['delete'])){
 $userid = $_SESSION['user']['id'] ;
 $proid = $_POST['product_id'];

 $sql = "DELETE FROM favorites WHERE userid = ? AND productid = ?";
 $delete = insert($sql, ['type' => 'i', 'value' => $userid], ['type' => 'i', 'value' => $proid]);
 
 header('Location: /account/favorites');
 }
 ?>