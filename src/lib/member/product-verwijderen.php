<?php
if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    die("Je hebt geen toestemming om deze actie uit te voeren.");
}

if (isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];

    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once LIB . '/util/util.php';

    // Voorkomen van SQL-injectie
    $product_id = mysqli_real_escape_string($conn, $product_id);

    // SQL-query om het product te verwijderen
    $query = "DELETE FROM products WHERE product_id = ?";
    $deleteData = insert($query, ['type' => 'i', 'value' => $product_id]);

    if ($deleteData) {
        echo "Product succesvol verwijderd.";
    } else {
        echo "Fout bij het verwijderen van het product.";
    }

    $conn->close();
} else {
    echo "Geen product_id meegegeven.";
}

header('Location: /');
return;
?>