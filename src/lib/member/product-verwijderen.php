<?php

 // Verbinding maken met de database
 require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
 require_once LIB . '/util/util.php';
 require_once DATABASE . '/connect.php';

// Controleer of een id is meegegeven via de URL
if (isset($_GET['productid'])) {
    $id = $_GET['productid'];

   


    // SQL-query om het product te verwijderen
    $query = "DELETE FROM products WHERE id = ?";

    $deleteData = insert($query, ['type' => 'i', 'value' => $id]);

    if ($deleteData) {
        header("Location: /dashboard/product-verwijderen?error=success");

    } else {
        header("Location: /dashboard/product-verwijderen?error=delete-product-failed");

    }
    var_dump($deleteData);  


   
} else {
    echo "Geen id meegegeven.";
}


?>