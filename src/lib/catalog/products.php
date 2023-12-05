<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php'; 

function getAllProducts() {
  $products = fetchSingle('SELECT * FROM products');

  foreach ($products as &$product) {
    if (strlen($product['name']) > 20) {
      $product['name'] = substr_replace($product['name'], '...', 21);
    }

    if (strlen($product['description']) > 100) {
      $product['description'] = substr_replace($product['description'], '...', 101);
    }
  }

  return $products;
}

function popularCategories($categoryLimit) {
  $query = "SELECT categoryid, product_categories.name, COUNT(*) AS count
            FROM products
            JOIN product_categories ON products.categoryid = product_categories.id GROUP BY products.categoryid
            ORDER BY count DESC
            LIMIT $categoryLimit";
  $categories = fetch($query);

  if ($categoryLimit === 1) {
    $categories = [$categories];
  }

  $products = [];
  foreach ($categories as $category) {
    $query = 'SELECT * FROM products WHERE categoryid = ? LIMIT 4';
    $products[$category['name']] = fetch($query, [
      'type' => 'i',
      'value' => $category['categoryid'],
    ]);
  }

  return $products;
}

function userProducts($userid) {
  $query = 'SELECT * FROM products WHERE userid = ?';
  $products = fetchSingle($query, ['type' => 'i', 'value' => $userid]);

  if (empty($products)) {
    return false;
  }

  if (isset($products['id'])) {
    $products = [$products];
  }

  foreach ($products as &$product) {
    if (strlen($product['name']) > 20) {
      $product['name'] = substr_replace($product['name'], '...', 21);
    }

    if (strlen($product['description']) > 100) {
      $product['description'] = substr_replace($product['description'], '...', 101);
    }
  }

  return $products;
}
