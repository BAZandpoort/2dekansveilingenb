<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $streetName = $_POST['streetName'];
    $houseNumber = $_POST['houseNumber'];
    $postalcode = $_POST['postalcode'];
    $town = $_POST['town'];

    $query = 'INSERT INTO add-address (streetName, houseNumber, postalcode, town) VALUES (?, ?, ?, ?)';
    insert(
        $query,
        ['type' => 's', 'value' => $streetName],
        ['type' => 'i', 'value' => $houseNumber],
        ['type' => 'i', 'value' => $postalcode],
        ['type' => 's', 'value' => $town]
    );

    echo 'Address added successfully';
}
?>