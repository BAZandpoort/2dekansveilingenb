<?php
if (!isset($_SESSION['user']) && !$_GET["id"]) {
  header('Location: /seller/dashboard');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$query = "SELECT products.*, product_categories.name AS category FROM products
          JOIN product_categories ON products.categoryid = product_categories.id 
          WHERE products.id = ? AND products.userid = ?";
$product = fetch($query, ['type' => 'i', 'value' => $_GET["id"]], ['type' => 'i', 'value' => $_SESSION["user"]["id"]],);

if (empty($product)) {
  // Should header to other page...
  exit();
}

$categories = fetch("SELECT * FROM product_categories");
?>

<h1 class="text-center text-4xl font-bold mb-12">Edit product</h1>

<form action="/src/lib/user/seller/edit-product.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <input type="hidden" name="id" value="<?= $product["id"] ?>">
  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Category -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Category</span>
      </label>
      <select name="category" class="select select-bordered w-full">
        <option disabled>Product category</option>
        <?php
        foreach ($categories as $category) {
          $selected = ($category["name"] === $product["category"]) ? "selected" : null;
          echo '<option value="' . $category['id'] . '" ' . $selected . '>' . $category['name'] . '</option>';
        }
        ?>
      </select>
    </div>

    <!-- Title -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Title</span>
      </label>
      <input value="<?= $product["name"] ?>" type="text" name="title" placeholder="Big Mac" class="input input-bordered w-full" required />
    </div>
  </div>

  <!-- Description -->
  <div class="form-control w-full">
    <label class="label">
      <span class="label-text">Description</span>
    </label>
    <textarea name="description" class="textarea textarea-bordered min-h-[8em]" placeholder="Very healthy food" required><?= $product["description"] ?></textarea>
  </div>

  <div class="flex flex-row justify-center gap-4 w-full">
    <!-- Price -->
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text tooltip" data-tip="Prices in euro">Price</span>
      </label>
      <input value="<?= $product["price"] ?>" type="number" step="0.01" min="0.00" name="price" placeholder="20.00" class="input input-bordered w-full" required />
    </div>
  </div>
  <!-- Image -->
<div class="form-control flex-1 w-full">
  <label class="label">
    <span class="label-text">Image</span>
  </label>
  <input name="image" type="file" class="file-input file-input-bordered w-full" />
</div>


  <div class="form-control w-full max-w-xs mt-4">
    <button name="edit" class="btn btn-primary">Update</button>
  </div>
</form>
