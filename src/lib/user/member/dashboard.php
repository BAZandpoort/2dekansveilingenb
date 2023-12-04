<?php

function favoriteCount()
{
  $userid = $_SESSION['user']['id'];

  $data = fetch(
    'SELECT COUNT(DISTINCT productid) as aantal FROM favorites WHERE userid = ?',
    [
      'type' => 'i',
      'value' => $userid,
    ],
  );

  echo $data['aantal'];
}

function purchasedCount()
{
  $userid = $_SESSION['user']['id'];

  $data = fetch(
    'SELECT COUNT(id) as count FROM orders WHERE buyerid =?',
    [
      'type' => 'i',
      'value' => $userid,
    ],
  );
  echo $data['count'];
}

function getPurchases($userid)
{
  $query = "SELECT * FROM orders INNER JOIN products ON orders.productid = products.id WHERE buyerid = ?";
  return fetchSingle(
    $query,
    ['type' => 'i', 'value' => $userid]
  );
}

function getFavorites($userid)
{
  $query = "SELECT * FROM products JOIN favorites ON (products.id = favorites.productid) WHERE favorites.userid = ?";
  return fetchSingle($query, ['type' => 'i', 'value' => $userid]);
}
