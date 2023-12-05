<?php
if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$categories = fetch("SELECT * FROM product_categories");

$minDate = date("Y-m-d\TH:i", strtotime("+1 hour"));
$maxDate = date("Y-m-d\TH:i", strtotime("+2 days"));
$endDateExplanation = "The auction end date must be at least 1 hour in the future and at most 2 days in the future.";
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
  <div class="form-control w-full">
    <label class="label">
      <span class="label-text">What delivery methods do you support?</span>
    </label>
    <div class="flex flex-row justify-between">
      <label class="label cursor-pointer gap-4">
        <span class="label-text">Standard</span>
        <input name="standard" type="checkbox" checked="checked" class="checkbox" />
      </label>
      <label class="label cursor-pointer gap-4">
        <span class="label-text">Express</span>
        <input name="express" type="checkbox" class="checkbox" />
      </label>
      <label class="label cursor-pointer gap-4">
        <span class="label-text">Pickup</span>
        <input name="pickup" type="checkbox" class="checkbox" />
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
    <div id="auctionWrapper" class="form-control flex-1 w-full justify-center">
      <label class="label">
        <div class="tooltip" data-tip="<?= $endDateExplanation ?>">
          <span class="label-text">Auction End Date</span>
        </div>
      </label>
      <input type="datetime-local" name="endDate" min="<?= $minDate ?>" max="<?= $maxDate ?>" class="input input-bordered w-full" required />
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
