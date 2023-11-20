<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

function fetch($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $result = $stmt->get_result();
  $data = $result->fetch_all(MYSQLI_ASSOC);

  $stmt->close();

  return $result->num_rows > 1 || empty($data) ? $data : $data[0];
}

function fetchSingle($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $result = $stmt->get_result();
  $data = $result->fetch_all(MYSQLI_ASSOC);

  $stmt->close();

  return $data;
}

function insert($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $stmt->close();
  return true;
}

// The following code SHOULD check for expired auctions and then add the highest bid from that auction into the successful_bids table WHEN ITS DONE.
$expired_auctions = fetch('SELECT * FROM products WHERE endDate < NOW()');
foreach ($expired_auctions as $expired_auction) {
  $successful_bid = fetch('SELECT * FROM bids WHERE  productid = ? ORDER BY price DESC LIMIT 1',['type' => 'i','value' => $expired_auction["id"]]);
  if (isset($successful_bid["id"])) {
    $query = 'INSERT INTO successful_bids (originalBidid, bidderid productid, bidPrice) VALUES (?, ?, ?, ?)';
    insert(
      $query,
      ['type' => 'i', 'value' => $successful_bid["id"]],
      ['type' => 'i', 'value' => $successful_bid["userid"]],
      ['type' => 'i', 'value' => $successful_bid["productid"]],
      ['type' => 'd', 'value' => ''.$successful_bid["bidPrice"].''],
    );

    $query = "DELETE FROM bids WHERE productid = ?";
    $deleteData = insert($query, ['type' => 'i', 'value' => $successful_bid["productid"]]);
  }
}
