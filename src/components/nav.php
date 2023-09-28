<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$userid = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;

if ($userid) {
  $query = 'SELECT * FROM user_profile WHERE userid = ?';
  $data = fetch($query, ['type' => 'i', 'value' => $userid]);

  $theme = $data['theme'] === 'dark' ? 'light' : 'dark';
}
?>

<div class="navbar bg-base-100 shadow-sm mb-10">
  <div class="navbar-start flex-1">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:flex">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" />
        </svg>
      </label>
      <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
        <li><a href="/catalog/products">Products</a></li>
        <li>
          <a>Categories</a>
          <ul class="p-2 shadow-sm ">
            <li><a>Category 1</a></li>
            <li><a>Category 2</a></li>
          </ul>
        </li>
        <li><a>Profile</a></li>
        <li><a href='/dashboard/products/add'>Add Product</a></li>
      </ul>
    </div>
    <a href="/" class="btn btn-ghost normal-case text-xl">2dekans veilingen</a>
  </div>
  <div class="navbar-center hidden lg:flex">
    <ul class="menu menu-horizontal px-1">
      <li><a href="/catalog/products">Catalog</a></li>
      <li tabindex="0">
        <details>
          <summary>Categories</summary>
          <ul class="p-2 shadow-sm absolute">
            <li><a>Category 1</a></li>
            <li><a>Category 2</a></li>
          </ul>
        </details>
      </li>
      <li><a>Profile</a></li>
      <li><a href='/dashboard/products/add'>Add Product</a></li>
      <li><a href='/dashboard/products/mine'>My Products</a></li>
    </ul>
  </div>

  <div class="flex-1 justify-end">
    <div class="dropdown dropdown-end mr-4">
      <label tabindex="0" class="btn btn-ghost btn-circle">
        <div class="indicator">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
          <span class="badge badge-sm indicator-item">8</span>
        </div>
      </label>
      <div tabindex="0" class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow">
        <div class="card-body">
          <span class="font-bold text-lg">8 Items</span>
          <span class="text-info">Subtotal: $999</span>
          <div class="card-actions">
            <button class="btn btn-primary btn-block">View cart</button>
          </div>
        </div>
      </div>
    </div>

    <?php echo isset($_SESSION['user'])
      ? '
        <div class="dropdown dropdown-end">
          <label tabindex="0" class="btn btn-ghost btn-circle avatar">
            <div class="w-10 rounded-full">
              <img src="https://avatars.githubusercontent.com/u/64209400?v=4" />
            </div>
          </label>
          <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
            <li>
              <a class="justify-between">
                Profile
                <span class="badge">New</span>
              </a>
            </li>
            <li><a href="/theme/change" >Switch to ' . $theme . '</a></li>
            <li><a>Settings</a></li>
            <li><a href="/account/logout"> logout</a></li>
            
          </ul>
        </div>
        '
      : '<a href="/account/login" class="btn"> Login</a>'; ?>
  </div>
</div>