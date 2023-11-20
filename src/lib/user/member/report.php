<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['send'])) {
  var_dump($_POST);
  $senderid = $_SESSION['user']['id'];
  $typeOfAbuse = $_POST['typeOfAbuse'];
  $context = $_POST['context'];
  $productid = $_POST['productid'];

  $insertData = sendReport(
    $productid,
    $senderid,
    $typeOfAbuse,
    $context
  );
}

header('Location: /');
exit();

// Add auction time
function sendReport(
  $productid,
  $senderid,
  $typeOfAbuse,
  $context
) {
  $query = 'INSERT INTO reports (productid, userid, type, context)
            VALUES (?, ?, ?, ?)';

  $insertData = insert(
    $query,
    ['type' => 'i', 'value' => $productid],
    ['type' => 'i', 'value' => $senderid],
    ['type' => 's', 'value' => $typeOfAbuse],
    ['type' => 's', 'value' => $context],
  );

  return $insertData;
}
