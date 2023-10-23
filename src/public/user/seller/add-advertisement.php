<?php
if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$products = fetch('SELECT * FROM products WHERE userid = '.$_SESSION["user"]["id"].'');
?>

<h1 class="text-center text-4xl font-bold mb-12">Add a new advertisement</h1>

<form action="/src/lib/user/seller/add-advertisement.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Category -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Product</span>
      </label>
      <select name="productid" class="select select-bordered w-full">
        <option disabled selected>Product</option>
        <?php
        foreach ($products as $product) {
          echo '<option value="' . $product['id'] . '">' . $product['name'] . '</option>';
        }
        ?>
      </select>
    </div>

    <!-- Title -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Alt text</span>
      </label>
      <input type="text" name="altText" placeholder="Big Mac" class="input input-bordered w-full" required />
    </div>
  </div>

  <!-- Image -->
  <div class="form-control flex-1 w-full">
    <label class="label">
      <span class="label-text">Image</span>
    </label>
    <input name="image" type="file" class="file-input file-input-bordered w-full" required />
  </div>

  <div class="form-control w-full max-w-xs mt-4">
    <button name="create" class="btn btn-primary">Create</button>
  </div>
</form>

<script>
  function showInput() {
    var auctionWrapper = document.getElementById("auctionWrapper");
    var checkBox = document.getElementById("auction");
    var checkBoxLabel = document.getElementById("auctionLabel");
    var input = document.getElementById("endDate");

    if (checkBox.checked == true) {
      input.classList.remove("hidden");
      checkBoxLabel.classList.add("hidden");
    } else {
      input.classList.add("hidden");
      checkBoxLabel.classList.remove("hidden");
    }
  }
</script>
