<?php
if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
?>


<div class="mt-24">
  <form action="/src/lib/user/admin/delete-product.php" method="post" class="flex flex-col items-center gap-4">
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
    <button type="submit" class="btn btn-error">Verwijderen</button>
  </form>
</div>