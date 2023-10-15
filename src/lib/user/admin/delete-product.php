<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['productid'])) {
    $product_id = $_POST['productid'];

    $query = "DELETE FROM products WHERE id = ?";
    $deleteData = insert($query, ['type' => 'i', 'value' => $product_id]);

    if ($deleteData) {
        header('Location: /dashboard/products/delete?success=deleteProduct');
        return;
    } else {
        header('Location: /dashboard/products/delete?error=deleteProduct');
        return;
    }
}

header('Location: /dashboard/products/delete');
return;
?>