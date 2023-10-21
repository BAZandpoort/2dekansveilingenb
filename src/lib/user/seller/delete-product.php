<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$hasProducts = count(array_filter(array_keys($_POST), function ($key) {
	return strpos($key, 'product-') === 0;
}));

if (isset($_POST['delete']) && $hasProducts) {
	$products = array_map(function ($key) {
		return explode('-', $key)[1];
	}, array_filter(array_keys($_POST), function ($key) {
		return strpos($key, 'product-') === 0;
	}));

	foreach ($products as $id) {
		$query = "DELETE FROM products WHERE id = ?";
		insert($query, ['type' => 'i', 'value' => intval($id)]);
	}


	header('Location: /seller/dashboard');
	exit();
}

header('Location: /');
exit();
