<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['send'])) {
    $customerid = $_SESSION['user']['id'];
    $productid = $_POST['productid'];
    $deliveryMethod = $_POST['deliveryMethod'];


    $insertData = sendReport(
        $customerid,
        $productid,
        $deliveryMethod
    );
}

header('Location: /');
exit();

function sendReport(
    $customerid,
    $productid,
    $deliveryMethod
) {
    $query = 'INSERT INTO delivery_orders (customerid, productid, deliveryMethod)
            VALUES (?, ?, ?)';

    $insertData = insert(
        $query,
        ['type' => 'i', 'value' => $customerid],
        ['type' => 'i', 'value' => $productid],
        ['type' => 's', 'value' => $deliveryMethod]
    );

    return $insertData;
}
