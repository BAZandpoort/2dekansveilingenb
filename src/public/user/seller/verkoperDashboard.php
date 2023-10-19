<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$sellerId = $_SESSION['user']['id'];

$query = "SELECT * FROM products WHERE userid = ?";
$products = fetchSingle($query, ['type' => 'i', 'value' => $sellerId]);
?>

<style>
  .clientImage {
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  .clientImage span {
    margin-left: 10px;
  }

  .clientImage img {
    width: 40px;
  }

  .reviewSection {
    padding: 1rem;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-around;
  }

  .reviewItem {
    width: 300px;
    padding: 10px;
    margin: 1rem;
    cursor: pointer;
    border-radius: 10px;

    border: 1px solid #10102a;
    transition: all .2s linear;
  }

  .reviewItem:hover {
    border-color: aqua;
    transform: scale(1.01);

    box-shadow: 0 0px 5px 0px #cbc0c0;
  }

  .top {
    margin-bottom: 1rem;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
  }

  .top ul {
    display: flex;
    list-style: none;
  }

  .top ul li {
    padding-left: 4px;
  }

  article p {
    font-size: 15px;
    font-weight: 100;
    margin-bottom: 1rem;
    font-family: system-ui;
  }
</style>

<!-- Top box -->
<div class="mt-24">
  <div class="box">
    <!-- Box contents -->
    <form method="post" action="delete_products.php">
      <div class="table-container">
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
      </div>

      <div class="w-full text-center mt-8">
        <button type="submit" name="delete_selected" class="btn btn-outline text-center">Delete</button>
        <a class="btn btn-outline text-center" href="/dashboard/products/add">Add Product</a>
      </div>

    </form>
  </div>
</div>

<div class="container mx-auto">
  <h2>Your reviews</h2>
  <p class="description">See what your latest buyers said about your product or your attitude as a seller/auctioneer!</p>

  <div class="reviewSection">
    <div class="reviewItem">
      <div class="top">
        <div class="clientImage">
          <img src="https://preview.redd.it/i-keep-seeing-this-angry-cat-meme-does-anyone-know-what-v0-n9p8aheg9jw91.jpg?width=1080&crop=smart&auto=webp&s=af0ff55ee92c8479c148d47e34d285633b98f76b" alt="">
          <span>Ben Dover</span>
        </div>
        <ul>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
        </ul>
      </div>
      <article>
        <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
          voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
          facere exercitationem!</p>
        <p>Jan 01, 2023</p>
      </article>
    </div>

    <div class="reviewItem">
      <div class="top">
        <div class="clientImage">
          <img src="https://thumbs.dreamstime.com/b/young-happy-positive-teenager-man-gesturing-ok-isolated-white-background-40784002.jpg" alt="">
          <span>Craven Morehed</span>
        </div>
        <ul>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
        </ul>
      </div>
      <article>
        <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
          voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
          facere exercitationem!</p>
        <p>Jan 01, 2023</p>
      </article>
    </div>

    <div class="reviewItem">
      <div class="top">
        <div class="clientImage">
          <img src="https://images.unsplash.com/photo-1605980776566-0486c3ac7617?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxhY2slMjBndXl8ZW58MHx8MHx8fDA%3D&w=1000&q=80" alt="">
          <span>Hugh Jass</span>
        </div>
        <ul>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-solid fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
          <li><i class="fa-regular fa-star"></i></li>
        </ul>
      </div>
      <article>
        <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
          voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
          facere exercitationem!</p>
        <p>Jan 01, 2023</p>
      </article>
    </div>
  </div>
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

<script defer>
  const checkAll = document.getElementById('checkAll');
  const checkboxes = document.querySelectorAll('input[name="products[]"]');
  
  checkAll.addEventListener('change', () => {
    checkboxes.forEach((checkbox) => {
      checkbox.checked = checkAll.checked;
    });
  });
</script>