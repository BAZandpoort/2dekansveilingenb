<?php
if(!isset($_GET["id"])){
  header("location: /");
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$id = $_GET["id"];
$query = "SELECT * FROM products WHERE id = ?";
$products = fetch($query, ['type' => 'i', 'value' => $id]);

$query2 = "SELECT * FROM users,user_profile
WHERE users.id=user_profile.userid
AND users.id = ?";
$seller = fetch($query2,['type' => 'i', 'value' => $id]);
?>


<div class="form-control">
  <label class="label">
    <span class="label-text">Enter amount</span>
  </label>
  <label class="input-group">
    <span>Price</span>
    <input type="number" placeholder="0,00" class="input input-bordered"/>
    <button type="submit" class="btn btn-warning" name="bied" >Bid</button>

  </label>
</div>
