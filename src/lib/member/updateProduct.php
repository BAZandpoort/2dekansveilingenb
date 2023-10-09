<?php
session_start();

if (isset($_POST['update_product'])) {

    $productId = $_POST['productId'];
    $productName = $_POST['productName'];
    $productDescription = $_POST['productDescription'];
    $productPrice = $_POST['productPrice'];
    $productImageUrl = $_POST['productImageUrl'];
    $productCategory = $_POST['productCategory'];

   
    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once DATABASE . '/connect.php';

    
    $selectQuery = "SELECT * FROM products WHERE id = $productId";
    $result = mysqli_query($connection, $selectQuery);

    if ($result && mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);

      
        if (
            $productName !== $row['name'] ||
            $productDescription !== $row['description'] ||
            $productPrice !== $row['price'] ||
            $productImageUrl !== $row['imageUrl'] ||
            $productCategory !== $row['categoryid']
        ) {
           
            $updateQuery = "UPDATE products SET
                name = '$productName',
                description = '$productDescription',
                price = '$productPrice',
                imageUrl = '$productImageUrl',
                categoryid = (
                    SELECT id FROM product_categories WHERE name = '$productCategory'
                )
                WHERE id = $productId";

            if (mysqli_query($connection, $updateQuery)) {
             
                $_SESSION['update_successfully'] =
                'Product updated successfully!';
            } else {
                echo "Error updating product: " . mysqli_error($connection);
            }
        } else {
            
            $_SESSION['no_changes1'] = 'No changes were made to your product.';
        }
    } else {
        echo "Product not found.";
    }

    mysqli_close($connection);
} else {
   
    header("Location: public/member/edit?id=" . $_POST['productId']);
    exit();
}
?>
