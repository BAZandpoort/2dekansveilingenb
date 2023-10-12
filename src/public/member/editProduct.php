<?php
if (!isset($_SESSION['user'])) {
    header('Location: /');
    exit();
}

if (isset($_GET['id'])) {
    $productId = $_GET['id'];
    $sellerId = $_SESSION['user']['id'];


    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once DATABASE . '/connect.php';

    $sql = "SELECT p.*, c.name AS category_name FROM products p 
            LEFT JOIN product_categories c ON p.categoryid = c.id 
            WHERE p.id = ? AND p.userid = ?";

    $stmt = mysqli_prepare($connection, $sql);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "ii", $productId, $sellerId);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($result) >= 1) {
            $row = mysqli_fetch_assoc($result);
            $productName = $row['name'];
            $productDescription = $row['description'];
            $productPrice = $row['price'];
            $productImageUrl = $row['imageUrl'];
            $productCategory = $row['category_name'];
    
          
        } else {
            echo "Debug: Product not found.";
        }

        mysqli_stmt_close($stmt);
    } else {
        die("Prepared statement error: " . mysqli_error($connection));
    }
} else {
    echo "Debug: Product ID is missing.";
}

if (isset($_SESSION['update_successfully'])) {
    echo '
      <div class="alert alert-success">
          <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
          <span>' . $_SESSION['update_success'] . '</span>
      </div>';
}
if (isset($_SESSION['no_changes1'])) {
    echo '
      <div class="alert alert-info">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
          <span>' . $_SESSION['no_changes'] .
          '</span>
      </div>';
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>

</head>
<body>

    <form method="post" action="/member/update" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
        <label for="productName">Product Name:</label>
        <input type="text" name="productName" class="input input-bordered w-full placeholder:opacity-30"  value="<?php echo $productName; ?>" required><br>

        <label for="productDescription">Product Description:</label>
        <input type="text" name="productDescription" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $productDescription; ?> " required><br>

        <label for="productPrice">Product Price:</label>
        <input type="number" name="productPrice" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $productPrice; ?>" required><br>

        <label for="productImageUrl">Product Image URL:</label>
        <input type="text" name="productImageUrl" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $productImageUrl; ?>" required><br>

        <label for="productCategory">Product Category:</label>
        <input type="text" name="productCategory" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $productCategory; ?>" required><br>

        <input type="hidden" name="productId" value="<?php echo $productId; ?>">
        <input type="submit" name="update_product" value="Update Product" class="btn btn-wide place-self-center">
        </div>
    </form>
</body>
</html>
