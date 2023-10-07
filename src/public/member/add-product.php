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

<form action="/src/lib/member/add-product.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Category -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Category</span>
      </label>
      <select name="category" class="select select-bordered w-full">
        <option disabled selected>Product category</option>
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

  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Price -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text tooltip" data-tip="Prices in euro">Price</span>
      </label>
      <input type="number" step="0.01" min="0.00" name="price" placeholder="20.00" class="input input-bordered w-full" required />
    </div>

    <!-- Auction End Date -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Auction End Date</span>
      </label>
      <input type="date" name="date" placeholder="20.00" class="input input-bordered w-full" required />
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
