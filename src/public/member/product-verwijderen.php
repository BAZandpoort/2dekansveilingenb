<?php
if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';



?>

<?php
$error = $_GET['error'] ?? false;
if ($error) {
  if ($error === 'success') {
    echo '
      <div class="alert alert-success w-full max-w-xs mx-auto mb-8">
        <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
      <span>Product deleted!</span>
      </div>
    ';

  } else {
    echo '
      <div class="alert alert-warning w-full max-w-xs mx-auto mb-8">
          <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
          <span>' . (ERROR_MAPPING[$error] ?? 'Unknown error') . '</span>
      </div>
    ';
  }
}
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




    <button type="submit" class="btn btn-error">Verwijderen</button>
  </form>
  
</div>