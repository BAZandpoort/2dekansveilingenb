<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';


if(isset($_POST['delete'])){

 session_start();

 $userid = $_SESSION['user']['id'] ;
 $proid = $_POST['product_id'];

 $sql = "DELETE FROM favorieten WHERE userid = ? AND id = ?";
 $delete = insert($sql, ['type' => 'i', 'value' => $userid], ['type' => 'i', 'value' => $proid]);
 
 header('Location: /account/favorite');

 }
 ?>