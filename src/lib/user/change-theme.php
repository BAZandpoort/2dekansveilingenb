<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
session_start();

$userid = $_SESSION["user"]["id"];



global $connection;
$sql = 'Select * From user_profile Where userid = ?';

$data = fetch($sql, ['type' => 'i', 'value' => $userid]);
var_dump($data);
// $data["mode"] == "dark"
//    ? insert('UPDATE user_profile SET mode = "light" WHERE userid = ?', ['type' => 'i', 'value' => $userid])
//    : insert('UPDATE user_profile SET mode = "dark" WHERE userid = ?', ['type' => 'i', 'value' => $userid]);

if ($data["mode"] === "dark") {
    $ins = insert('UPDATE user_profile SET mode = "light" WHERE userid = ?', ['type' => 'i', 'value' => $userid]);
} else {
    $ins = insert('UPDATE user_profile SET mode = "dark" WHERE userid = ?', ['type' => 'i', 'value' => $userid]);
}


print $sql;

header("Location: /");