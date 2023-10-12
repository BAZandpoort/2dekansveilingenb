<?php
// if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
//     die("Je hebt geen toestemming om deze actie uit te voeren.");
// }

if (isset($_POST['productid'])) {
    $product_id = $_POST['productid'];

    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once LIB . '/util/util.php';

    // Voorkomen van SQL-injectie
    $product_id = mysqli_real_escape_string($connection, $product_id);

    // SQL-query om het product te verwijderen
    $query = "DELETE FROM products WHERE id = ?";
    $deleteData = insert($query, ['type' => 'i', 'value' => $product_id]);

    if ($deleteData) {
        header('Location: /dashboard/product-verwijderen?success=deleteProduct');
        return;
    } else {
        header('Location: /dashboard/product-verwijderen?error=deleteProduct');
        return;
    }
} else {
    echo "Geen product_id meegegeven.";
}

header('Location: /dashboard/product-verwijderen');
return;
?>