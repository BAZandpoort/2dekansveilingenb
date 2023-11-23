<?php
if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$categories = fetch("SELECT * FROM product_categories");
?>

<h1 class="text-center text-4xl font-bold mb-12">Add a new product</h1>

<form action="/src/lib/user/seller/add-product.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Category -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Product category</span>
      </label>
      <select name="category" class="select select-bordered w-full">
        <?php
        foreach ($categories as $category) {
          echo '<option value="' . $category['id'] . '">' . $category['name'] . '</option>';
        }
        ?>
      </select>
    </div>

    <!-- Title -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Title</span>
      </label>
      <input type="text" name="title" placeholder="Big Mac" class="input input-bordered w-full" required />
    </div>
  </div>
  
  <!-- Description -->
  <div class="form-control w-full">
    <label class="label">
      <span class="label-text">Description</span>
    </label>
    <textarea name="description" class="textarea textarea-bordered min-h-[8em]" placeholder="Very healthy food" required></textarea>
  </div>

  <!-- Delivery methods -->
  <h2 class="text-center text-2xl font-bold mb-0">Which delivery methods do you support?</h2>
  <div class="flex flex-col">
  <div class="form-control w-52">
    <label class="cursor-pointer label">
      <span class="label-text">Standard delivery</span> 
      <input type="checkbox" id="standardDelivery" name="standardDelivery" onclick="checkForDelivery()" class="toggle toggle-primary" checked />
    </label>
  </div>
  <div class="form-control w-52">
    <label class="cursor-pointer label">
      <span class="label-text">Express delivery</span> 
      <input type="checkbox" id="expressDelivery" name="expressDelivery" onclick="checkForDelivery()" class="toggle toggle-secondary" checked />
    </label>
  </div>
  <div class="form-control w-52">
    <label class="cursor-pointer label">
      <span class="label-text">Pickup</span> 
      <input type="checkbox" id="pickUp" name="pickUp" onclick="checkForDelivery()" class="toggle toggle-accent" checked />
    </label>
  </div>
  </div>

  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Price -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text tooltip" data-tip="Prices in euro">Price</span>
      </label>
      <input type="number" step="0.01" min="0.00" name="price" placeholder="20.00" class="input input-bordered w-full" required />
    </div>

    <!-- Auction End Date -->
    <div id="auctionWrapper" class="form-control flex-1 flex-row w-full justify-center gap-4">
      <div id="endDate" class="hidden">
        <label class="label">
          <span class="label-text">Auction End Date</span>
        </label>
        <input type="datetime-local" name="endDate" placeholder="20.00" class="input input-bordered w-full" required />
      </div>

      <div class="flex flex-row gap-4 justify-center items-center mt-10">
        <input type="checkbox" name="auction" id="auction" onclick="showInput()" class="checkbox checkbox-lg" />
        <label id="auctionLabel" class="label">
          <span class="label-text">Is this an auction?</span>
        </label>
      </div>
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
    <button name="create" id="create" class="btn btn-primary">Create</button>
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

  function checkForDelivery() {
    var checkBoxSD = document.getElementById("standardDelivery");
    var checkBoxED = document.getElementById("expressDelivery");
    var checkBoxPU = document.getElementById("pickUp");


    if (checkBoxSD.checked == false && checkBoxED.checked == false && checkBoxPU.checked == false) {
      document.getElementById("create").disabled = true;
      document.getElementById("create").textContent = "Please select at least one delivery option";
    } else {
      document.getElementById("create").disabled = false;
      document.getElementById("create").textContent = "Create";
    }
  }
</script>
