<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';


if (isset($_POST["favorieten"])) {
    session_start();

    

    $userid = $_SESSION['user']['id'] ;
    $proid = $_POST['product_id'];
    $referer = $_POST['refer'];

    $sql = insert("INSERT INTO favorieten (userid, id) VALUES ($userid, $proid)");
   
   header('Location: ' . $referer);
  }


?>