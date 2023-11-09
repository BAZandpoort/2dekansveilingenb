<?php

function favoriteCount() {
  $userid = $_SESSION['user']['id'];

  $data = fetch(
    'SELECT COUNT(DISTINCT userid) as aantal FROM favorites WHERE userid = ?',
    [
      'type' => 'i',
      'value' => $userid,
    ],
  );
  
  echo $data['aantal'];
}

function purchasedCount() {
  $userid = $_SESSION['user']['id'];

  $data = fetch(
    'SELECT COUNT(id) as aantal FROM user_purchases WHERE id =?',
    [
      'type' => 'i',
      'value' => $userid,
    ],
  );
  echo $data['aantal'];
}

function getPurchases($userid) {
  $query = "SELECT * FROM user_purchases WHERE id = ?";
  return fetchSingle($query, ['type' => 'i', 'value' => $userid]);
}

function getFavorites($userid) {
  $query = "SELECT * FROM products JOIN favorites ON (products.id = favorites.productid) WHERE favorites.userid = ?";
  return fetchSingle($query, ['type' => 'i', 'value' => $userid]);
}
