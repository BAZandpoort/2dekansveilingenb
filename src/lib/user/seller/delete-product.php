<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

// Count the number of products in the $_POST array that have keys starting with 'product-'
$hasProducts = count(array_filter(array_keys($_POST), function ($key) {
	return strpos($key, 'product-') === 0;
}));

// Check if the 'delete' button is clicked and there are products to delete
if (isset($_POST['delete']) && $hasProducts) {
	// Extract the product IDs from the $_POST array
	$products = array_map(function ($key) {
		return explode('-', $key)[1];
	}, array_filter(array_keys($_POST), function ($key) {
		return strpos($key, 'product-') === 0;
	}));

	// Delete each product from the 'products' table in the database
	foreach ($products as $id) {
		$query = "DELETE FROM products WHERE id = ?";
		insert($query, ['type' => 'i', 'value' => intval($id)]);
	}

	// Redirect the user to the seller dashboard after deleting the products
	header('Location: /seller/dashboard');
	exit();
}

// Redirect the user to the homepage if the 'delete' button is not clicked or there are no products to delete
header('Location: /');
exit();
