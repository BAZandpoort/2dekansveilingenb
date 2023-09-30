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

<!-- Top navbar -->
<div class="navbar bg-base-100">
  <!-- Left - logo -->
  <div class="navbar-start flex-1">
    <a href="/" class="btn btn-ghost normal-case text-xl">2dekans veilingen</a>
  </div>

  <!-- Center - search -->
  <div class="flex-1">
    <div class="form-control w-full">
      <input type="text" placeholder="Search" class="input input-bordered w-24 md:w-auto" />
    </div>
    <div class="dropdown dropdown-end">
    </div>
  </div>

  <!-- Right - User actions -->
  <div class="flex-1 justify-end">
    <div class="dropdown dropdown-end mr-4">
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
            <li><a href="/src/lib/account/change-theme.php" >Switch to ' .
        $theme .
        '</a></li>
            <li><a>Settings</a></li>
            <li><a href="/account/logout"> logout</a></li>
            
          </ul>
        </div>
        '
      : '<a href="/account/login" class="btn"> Login</a>'; ?>
  </div>
</div>

<!-- Bottom navbar -->
<div class="navbar bg-base-100 shadow-sm pt-8">
  <div class="navbar-center flex w-full">
    <ul class="menu menu-horizontal px-1 gap-16 w-full justify-center">
      <a href="/catalog/products?category=veilingen" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-gavel fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Veilingen</span>
      </a>
      <a href="/catalog/products?category=locatie" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-location-dot fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Locatie</span>
      </a>
      <a href="/catalog/products?category=products" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-box-open fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Producten</span>
      </a>
      <a href="/catalog/products?category=autos" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-car-side fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Auto's</span>
      </a>
      <a href="/catalog/products?category=kledij" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-shirt fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Kledij</span>
      </a>
      <a href="/catalog/products?category=elektronica" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-mobile fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Elektronica</span>
      </a>
      <a href="/catalog/products?category=huis" class="group flex flex-col gap-4 items-center">
        <i class="fa-solid fa-house fa-2xl group-hover:-translate-y-1 transition"></i>
        <span class="label-text">Huis en inrichting</span>
      </a>
    </ul>
  </div>
</div>