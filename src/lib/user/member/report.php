<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['send'])) {
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
  $query = 'INSERT INTO reports (productid, userid, typeOfAbuse, context)
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
