<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['create'])) {
  $userid = $_SESSION['user']['id'];
  $productid = $_POST['productid'];
  $altText = $_POST['altText'];
  $file = $_FILES['image'];

  $insertData = addAdvertisement(
    $userid,
    $productid,
    $altText,
    $file
  );
}

header('Location: /');
exit();

function addAdvertisement(
  $userid,
  $productid,
  $altText,
  $file,
) {
  $query = 'INSERT INTO advertisements (productid, sellerid, description, image)
            VALUES (?, ?, ?, ?)';

  $imageName = $file['name'];
  $imageTmpName = $file['tmp_name'];

  $targetDir = PUBLIC_R . "/advertisements/";
  $baseImageName = basename($imageName, ".jpg") . '--userid-' . $userid . ".jpg";
  $targetFile = $targetDir . $baseImageName;
  move_uploaded_file($imageTmpName, $targetFile);
  echo "<br><br>";
  $insertData = insert(
    $query,
    ['type' => 'i', 'value' => $productid],
    ['type' => 'i', 'value' => $userid],
    ['type' => 's', 'value' => $altText],
    ['type' => 's', 'value' => $baseImageName],
  );

  return $insertData;
}
