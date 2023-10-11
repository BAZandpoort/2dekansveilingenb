<?php


// Controleer of een id is meegegeven via de URL
if (isset($_GET['productid'])) {
    $id = $_GET['productid'];

    // Verbinding maken met de database
    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once LIB . '/util/util.php';
    require_once DATABASE . '/connect.php';

    



    // SQL-query om het product te verwijderen
    $query = "DELETE FROM products WHERE id = ?";
    $deleteData = insert($query, ['type' => 'i', 'value' => $id]);

    if ($deleteData) {
        echo "Product succesvol verwijderd.";
    } else {
        echo "Fout bij het verwijderen van het product.";
    }

} else {
    echo "Geen id meegegeven.";
}

 
return;
?>