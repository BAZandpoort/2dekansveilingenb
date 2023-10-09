<?php

if (isset($_POST['delete_selected'])) {
 
    if (isset($_POST['selected_products']) && is_array($_POST['selected_products'])) {
        $selectedProducts = $_POST['selected_products'];

       
        require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
        require_once DATABASE . '/connect.php';

   
        $productIds = implode(',', $selectedProducts);

     
        $deleteQuery = "DELETE FROM products WHERE id IN ($productIds)";

        if (mysqli_query($connection, $deleteQuery)) {
           
            header("Location: /verkoper-dashboard");
            exit();
        } else {
            echo "Error deleting products: " . mysqli_error($connection);
        }

        mysqli_close($connection);
    } else {
        echo "No products selected for deletion.";
    }
} else {
    
    header("Location: /");
    exit();
}

?>
