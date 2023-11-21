<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

session_start();


if (isset($_POST['addAddress'])) {
  addAddress();
  exit();
}

function addAddress() {
    $userid = $_SESSION['user']['id'] ;
    $streetName = $_POST['streetName'];
    $houseNumber = $_POST['houseNumber'];
    $postalcode = $_POST['postalcode'];
    $city = $_POST['city'];

    $initialized = insertAdres($userid, $streetName, $houseNumber, $postalcode, $city);
    if (!$initialized) {
        header('Location: /seller/add-address?error=addAddress');
        return;
      }
      

}
function insertAdres(){
    $userid = $_SESSION['user']['id'] ;
    $streetName = $_POST['streetName'];
    $houseNumber = $_POST['houseNumber'];
    $postalcode = $_POST['postalcode'];
    $city = $_POST['city'];

    $query = 'INSERT INTO `add-address` (userid, streetName, houseNumber, postalcode, city) VALUES (?, ?, ?, ?, ?)';


    
    insert(
        $query,
        ['type' => 'i', 'value' => $userid],
        ['type' => 's', 'value' => $streetName],
        ['type' => 'i', 'value' => $houseNumber],
        ['type' => 'i', 'value' => $postalcode],
        ['type' => 's', 'value' => $city]
    );
      
      header('Location: /seller/add-address?success=addAddress');
      exit();
      //make the header go to the previous page with a success message
    }

?>