<?php
if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';



?>

<div>
  <form action="/src/lib/member/product-verwijderen.php" method="get" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="productid">product ID</label>
      <input
      name="productid"
      id="productid"
      type="number"
      placeholder="1"
      class="input input-bordered w-full placeholder:opacity-30"
      required/>
    </div>




    <input type="submit" name="productid" value="delete product" class="btn btn-wide place-self-center">
  </form>
  
</div>