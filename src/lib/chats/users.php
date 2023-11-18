<?php

session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userssid = $_SESSION['user']['id'];
$outgoing_id = $userssid;

$product_id = $_GET['id'];

$sql = mysqli_query($connection, "SELECT *
FROM users
JOIN user_profile ON users.id = user_profile.userid
JOIN products ON products.userid = users.id
WHERE products.id = {$product_id}");

$row = mysqli_fetch_assoc($sql);

$output = "";

if (!$row) {
    $output .= "No user available"; 
} else {
    $output .= '<a href="/chats/chat?userid=' . $row['userid'] . '">
                <button class="button bg-amber-300 px-2 my-1 mx-2 rounded-3xl text-3xl hover:bg-sky-700">
                <i class="fas fa-comments mx-1 pb-1"></i></button>
                </a>';      
}

echo $output;
?>
