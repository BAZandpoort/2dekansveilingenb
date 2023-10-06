<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
?>

<!DOCTYPE html>
<head></head>
<body>
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

</body>



