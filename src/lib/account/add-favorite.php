<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

session_start();

if (isset($_POST["favorieten"])) {
    $userid = $_SESSION['user']['id'] ;
    $proid = $_POST['product_id'];
    $referer = $_POST['refer'];

    $sql = insert("INSERT INTO favorites (userid, productid) VALUES ($userid, $proid)");
   
   header('Location: ' . $referer);
  }


?>