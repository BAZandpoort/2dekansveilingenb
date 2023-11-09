<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['edit'])) {
  $id = $_POST['id'];
  $category = $_POST['category'];
  $title = $_POST['title'];
  $description = $_POST['description'];
  $price = $_POST['price'];
  
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
