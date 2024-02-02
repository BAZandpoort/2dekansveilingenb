<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once DATABASE . '/connect.php';

$query = "SELECT *, COUNT(*) AS 'amount' FROM bids WHERE productid = ? AND bidder = ?";
$bidData = fetch(
  $query,
  ["type" => "i", "value" => $_GET['productid']],
  ["type" => "i", "value" => $_SESSION['user']['id']],
);

$productId = $_GET['productid'];

require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/secrets.php';

\Stripe\Stripe::setApiKey($stripeSecretKey);
header('Content-Type: application/json');

$YOUR_DOMAIN = 'http://localhost:8080';

$stripe = new \Stripe\StripeClient($stripeSecretKey);

$response = $stripe->prices->create([
  'currency' => 'eur',
  'unit_amount' => ($bidData["price"]*100),
  'product_data' => ['name' => 'Scrap'],
]);

$price_id = $response["id"];

$checkout_session = \Stripe\Checkout\Session::create([
  'line_items' => [[
    # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
    'price' => $price_id,
    'quantity' => 1,
  ]],
  'mode' => 'payment',
  'success_url' => $YOUR_DOMAIN . '/catalog/delivery_order?productid=' . $productId . '',
  'cancel_url' => $YOUR_DOMAIN . '/catalog/cancel',
]);

header("HTTP/1.1 303 See Other");
header("Location: " . $checkout_session->url);