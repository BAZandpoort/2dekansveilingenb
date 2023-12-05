<?php
session_start();

if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (!isset($_POST['create'])) {
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  exit();
}

$userid = $_SESSION["user"]["id"];
$categoryid = $_POST['category'];
$title = $_POST['title'];
$description = $_POST['description'];
$price = $_POST['price'];
$file = $_FILES['image'];
$endDate = $_POST['endDate'];
$standardDelivery = isset($_POST["standard"]);
$expressDelivery = isset($_POST["express"]);
$pickUp = isset($_POST["pickup"]);

$query = 'INSERT INTO products (userid, categoryid, name, description, price, image, endDate, deliveryStandard, deliveryExpress, deliveryPickup)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

$extension = pathinfo($file['name'], PATHINFO_EXTENSION);
$imageName = uniqid() . '.' . $extension;
$imageTmpName = $file['tmp_name'];

$targetDir = PUBLIC_R . "/images/";
$targetFile = $targetDir . $imageName;
move_uploaded_file($imageTmpName, $targetFile);

insert(
  $query,
  ['type' => 'i', 'value' => $userid],
  ['type' => 'i', 'value' => $categoryid],
  ['type' => 's', 'value' => $title],
  ['type' => 's', 'value' => $description],
  ['type' => 'd', 'value' => $price],
  ['type' => 's', 'value' => $imageName],
  ['type' => 's', 'value' => $endDate],
  ['type' => 'i', 'value' => $standardDelivery],
  ['type' => 'i', 'value' => $expressDelivery],
  ['type' => 'i', 'value' => $pickUp],
);

header ('Location: /');
