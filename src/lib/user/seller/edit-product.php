<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['edit'])) {
  $id = $_POST['id'];
  $category = $_POST['category'];
  $title = $_POST['title'];
  $description = $_POST['description'];
  $price = $_POST['price'];
 
  if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
    $file = $_FILES['image'];
    $imageName = $file['name'];

  
    $targetDir = $_SERVER['DOCUMENT_ROOT'] . '/public/images/';
    $baseImageName = 'productid-' . $id . '.jpg';
    $targetFile = $targetDir . $baseImageName;

    if (move_uploaded_file($file['tmp_name'], $targetFile)) {
 
      $imageUpdateQuery = "UPDATE products SET image = ? WHERE id = ?";
      $insertData = insert($imageUpdateQuery, ['type' => 's', 'value' => $baseImageName], ['type' => 'i', 'value' => $id]);

  
      if ($insertData === false) {
        die('Error updating image URL in the database.');
      }
    } else {
      die('Error moving uploaded file.');
    }
  }

  $query = "UPDATE products SET categoryid = ?, name = ?, description = ?, price = ? WHERE id = ?";
  

  insert(
    $query, 
    ['type' => 'i', 'value' => $category], 
    ['type' => 's', 'value' => $title], 
    ['type' => 's', 'value' => $description], 
    ['type' => 's', 'value' => $price], 
    ['type' => 'i', 'value' => $id]
  );  
}
header('Location: /seller/dashboard');
exit();
?>
