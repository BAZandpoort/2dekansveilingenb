<?php
$user = $_SESSION['user'];
$id = $user['id'];

if (isset($_GET['id'])) {
  $id = $_GET['id'];
}

$profileUser = fetch("SELECT * FROM users 
JOIN user_profile ON users.id = user_profile.userid 
WHERE users.id = ?", ['type' => 'i', 'value' => $id]);

$profileProducts = fetchSingle("SELECT * FROM products WHERE userid = ?", ['type' => 'i', 'value' => $id]);
?>

<!-- Profile Section -->
<div class="container mx-auto mt-8 p-4 bg-base-100 rounded-lg shadow-lg">

  <!-- Seller Info -->
  <div class="flex items-center justify-between mb-4">
    <div class="flex items-center">
      <img src="/public/images/<?= $profileUser['profilepicture'] ?>" alt="Seller Avatar" class="h-12 w-12 rounded-full object-cover">
      <div class="ml-4">
        <h1 class="text-2xl font-bold"><?= $profileUser['firstname'] ?> <?= $profileUser['lastname'] ?></h1>
        <p class="text-gray-500">Username: <?= $profileUser['username'] ?></p>
      </div>
    </div>
  </div>

  <!-- Products Section -->
  <h2 class="text-xl font-bold mb-2">Products for Sale</h2>

  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
    <!-- Product Card Example -->
    <?php if (!empty($profileProducts)) : ?>
      <?php foreach ($profileProducts as $product) : ?>
        <div class="card card-compact w-96 bg-base-100 shadow-xl">
          <figure><img class="rounded-xl" src="/public/images/<?= $product['image'] ?>" alt="Product image" /></figure>
          <div class="card-body">
            <h2 class="card-title"><?= $product['name'] ?></h2>
            <p><?= $product['description'] ?></p>
            <div class="card-actions justify-end">
              <a href="/catalog/product?id=<?= $product['id'] ?>" class="btn btn-primary">View product</a>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    <?php else : ?>
      <div class="bg-gray-200 p-4 rounded-lg">
        <h3 class="text-lg font-semibold">No Products Available</h3>
        <p class="text-gray-500">This user has no products available for sale.</p>
      </div>
    <?php endif; ?>

  </div>
</div>