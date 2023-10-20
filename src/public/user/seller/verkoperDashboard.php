<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$sellerId = $_SESSION['user']['id'];

$query = "SELECT * FROM products WHERE userid = ?";
$products = fetchSingle($query, ['type' => 'i', 'value' => $sellerId]);
?>

<!-- Top box -->
<div class="flex flex-col gap-16">
  <!-- Box contents -->
  <?php if (empty($products)): ?>
    <p>No products</p>
  <?php else: ?>
  <form method="post" action="delete_products.php">
    <div class="overflow-x-auto">
      <table class="table">
        <thead>
          <tr>
            <th>
              <label>
                <input type="checkbox" class="checkbox" id="checkAll" />
              </label>
            </th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Category</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach($products as $product):
            $categoryName = fetchSingle('SELECT * FROM product_categories WHERE id = ?', ['type' => 'i', 'value' => $product['categoryid']])[0]['name'];
          ?>
          <tr>
            <th>
              <label>
                <input name="products[]" type="checkbox" class="checkbox" />
              </label>
            </th>

            <td>
              <div class="flex flex-col">
                <div class="font-bold"><?= $product['name'] ?></div>
                <div class="text-sm opacity-50">Until <?= $product['endDate'] ?></div>
              </div>
            </td>
            
            <td><?= $product['description'] ?></td>
            <td>€ <?= $product['price'] ?></td>
            <td><?= $categoryName ?></td>

            <th>
              <button class="btn btn-ghost btn-xs">Edit</button>
            </th>
          </tr>
          <?php endforeach ?>
        </tbody>

        <tfoot>
          <tr>
            <th></th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Category</th>
            <th></th>
          </tr>
        </tfoot>
      </table>
    </div>

    <div class="w-full text-center mt-8">
      <button type="submit" name="delete_selected" class="btn btn-outline text-center">Delete</button>
      <a class="btn btn-outline text-center" href="/dashboard/products/add">Add Product</a>
    </div>
  </form>
  <?php endif ?>

  <div>
    <div class="text-center">
      <p class="text-2xl">Your reviews</p>
      <p class="description">See what your latest buyers said about your product or your attitude as a seller/auctioneer!</p>
    </div>

    <div class="flex flex-wrap items-center justify-center p-1">
      <div class="w-72 p-2 m-1 rounded-lg border-solid border-2 border-pink-900">
        <div class="mb-1 flex flex-row items-center justify-between">
          <div class="flex flex-row items-center">
            <img class="w-10" src="https://preview.redd.it/i-keep-seeing-this-angry-cat-meme-does-anyone-know-what-v0-n9p8aheg9jw91.jpg?width=1080&crop=smart&auto=webp&s=af0ff55ee92c8479c148d47e34d285633b98f76b" alt="">
            <span class="ml-4">Ben Dover</span>
          </div>
          <ul class="flex">
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
          </ul>
        </div>
        <article class="text-lg font-thin mb-1">
          <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
            voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
            facere exercitationem!</p>
          <p>Jan 01, 2023</p>
        </article>
      </div>

      <div class="w-72 p-2 m-1 rounded-lg border-solid border-2 border-pink-900">
        <div class="mb-1 flex flex-row items-center justify-between">
          <div class="flex flex-row items-center">
            <img class="w-10" src="https://thumbs.dreamstime.com/b/young-happy-positive-teenager-man-gesturing-ok-isolated-white-background-40784002.jpg" alt="">
            <span class="ml-4">Craven Morehed</span>
          </div>
          <ul class="flex">
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
          </ul>
        </div>
        <article class="text-lg font-thin mb-1">
          <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
            voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
            facere exercitationem!</p>
          <p>Jan 01, 2023</p>
        </article>
      </div>

      <div class="w-72 p-2 m-1 rounded-lg border-solid border-2 border-pink-900">
        <div class="mb-1 flex flex-row items-center justify-between">
          <div class="flex flex-row items-center">
            <img class="w-10" src="https://images.unsplash.com/photo-1605980776566-0486c3ac7617?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxhY2slMjBndXl8ZW58MHx8MHx8fDA%3D&w=1000&q=80" alt="">
            <span class="ml-4">Hugh Jass</span>
          </div>
          <ul class="flex">
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-solid fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
            <li><i class="fa-regular fa-star"></i></li>
          </ul>
        </div>
        <article class="text-lg font-thin mb-1">
          <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
            voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
            facere exercitationem!</p>
          <p>Jan 01, 2023</p>
        </article>
      </div>
    </div>
    
    <div class="text-center">
      <a href="/" class="link">Click to see more</a>

      <h2>Your current rating as seller/auctioneer</h2>
      <div class="rating">
        <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" checked />
        <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400 " />
      </div>
    </div>
  </div>
</div>

<script defer>
  const checkAll = document.getElementById('checkAll');
  const checkboxes = document.querySelectorAll('input[name="products[]"]');
  
  checkAll.addEventListener('change', () => {
    checkboxes.forEach((checkbox) => {
      checkbox.checked = checkAll.checked;
    });
  });
</script>