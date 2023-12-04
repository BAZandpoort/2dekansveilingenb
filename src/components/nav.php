<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once LIB . '/util/translations.php';

$languageDisplay = '';
$languageMap = [
  'text_en' => 'English',
  'text_nl' => 'Nederlands',
  'text_fr' => 'Français',
];

$language = getUserLanguage();
$languageDisplay = $languageMap[$language];

$theme = getUserTheme() === 'customDark' ? 'light' : 'dark';

$searchTerm = $_GET['search'] ?? '';

// Outbid notification
$notification = false;
$productOutbidded = -1;
$data = [];
if ($user) {
  $data = fetch('SELECT * FROM notifications WHERE oldbidder = ? AND `read` = 0', ['type' => 'i', 'value' => $user['id']]);
}

if (!empty($data)) {
  $notification = true;

  $query = "SELECT productid FROM bids_history WHERE id = ?";
  $result = fetch($query, ["type" => "i", "value" => $data['bidid']]);

  $notificationLink = $result['productid'];
} else {
  // MOVE: Notification should be added when placing a bid
  $data = fetchSingle('SELECT * FROM bids_history');
  if ($user) {
    foreach ($data as $bid) {
      if ($bid['bidder'] === $user['id']) {
        $productId = $bid['productid'];
        $productBids = fetchSingle(
          'SELECT * FROM bids_history WHERE productid = ? ORDER BY price DESC',
          ['type' => 'i', 'value' => $productId],
        );
        
        if ($bid['bidder'] === $productBids[0]['bidder']) {
          continue;
        }

        $query = "SELECT * FROM notifications WHERE oldbidder = ? AND bidid = ?";
        $result = fetch(
          $query,
          ["type" => "i", "value" => $user['id']],
          ["type" => "i", "value" => $productBids[0]['id']]
        );

        if ($bid['price'] < $productBids[0]['price'] && $result['read'] === 0) {
          $notification = true;
          $notificationLink = $bid['productid'];
          break;
        }
      }
    }
  }
}

if ($user) {
  $query = "SELECT * FROM user_profile WHERE userid = ?";
  $userData = fetchSingle($query, ['type' => 'i', 'value' => $user['id']]);
  $profileImage = $userData[0]['profilepicture'];
}

$admin = '';
if ($user && $user['role'] === 'admin') {
  $admin = '
  <div class="divider px-4 mb-2">ADMIN</div>
  <li><a href="/admin/dashboard">Dashboard</a></li>
  <li><a href="/dashboard/reports">' . translate($user, 'Reports') . '</a></li>
  <li>
    <details class="dropdown dropdown-left">
      <summary class="m-1">' . translate($user, 'Translations') . '</summary>
      <ul class="p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
        <li><a href="/dashboard/translations">' . translate($user, 'View translations') . '</a></li>
        <li><a href="/dashboard/translations/add">' . translate($user, 'Add translations') . '</a></li>
      </ul>
    </details>
  </li>
  ';
}
?>

<!-- Top navbar -->
<div class="navbar bg-base-100 px-2 gap-2 md:gap-0 md:px-4">
  <!-- Left - logo -->
  <div class="navbar-start flex-1">
    <!-- Dropdown menu on small devices -->
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost md:hidden">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" />
        </svg>
      </label>
      <ul tabindex="0" class="menu menu-sm ml-0 dropdown-content mt-3 z-[1] p-2 pb-4 shadow bg-base-100 rounded-box w-64">
        <li><a href="/" class="text-lg">Home</a></li>
        <div class="divider my-2 px-6"></div>

        <!-- Account actions -->
        <?php echo isset($_SESSION['user'])
          ? '
          <li>
            <details>
              <summary class="text-lg">
              <div class="w-8">
                <img class="rounded-full" src="/public/images/test.jpg" />
              </div>
              Account
              </summary>
              <ul>
                <li><a href="/src/lib/user/member/change-theme.php" >Switch to ' . $theme . ' mode</a></li>
                <li><a href="/account/settings/edit">Settings</a></li>
                <li><a href="/account/logout"> ' . translate($user, 'Log out') . ' </a></li>
              </ul>
            </details>
          </li>
          '
          : '<li><a href="/account/login" class="text-lg">Login</a></li>'; ?>
        <!-- Language Select -->
        <li>
          <details>
            <summary class="text-lg"><?php echo $languageDisplay; ?></summary>
            <ul>
              <form action="/src/lib/user/member/change-language.php" method="post">
                <li><input type="submit" name="text_en" value='English'></li>
                <li><input type="submit" name="text_nl" value='Nederlands'></li>
                <li><input type="submit" name="text_fr" value='Français'></li>
              </form>
            </ul>
          </details>
        </li>
        <li>
          <a class="text-lg" href="/chats/users">
            <?= translate($user, 'Messages') ?>
          </a>
        </li>

        <!-- Categories -->
        <li>
          <details>
            <summary class="text-lg">Catalog</summary>
            <ul class="flex flex-col gap-2">
              <?php
              $categories = fetch('SELECT * FROM product_categories LIMIT 10');
              if ($categories) {
                foreach ($categories as $category) {
                  echo '
                  <li>
                    <a href="/catalog/products?category=' . $category['name'] . '" class="text-lg">
                      <i class="fa-solid ' . $category['icon'] . ' group-hover:-translate-y-1 transition"></i>
                      <span class="label-text">' . $category['name'] . '</span>
                    </a>
                  </li>';
                }
              }
              ?>
            </ul>
          </details>
        </li>
      </ul>
    </div>

    <a href="/" class="hidden btn btn-ghost no-animation normal-case text-xl md:flex">
      <?php echo translate($user, '2nd-chance auctions'); ?>
    </a>
  </div>

  <!-- Center - search -->
  <div class="w-full md:flex-1">
    <form action="/catalog/products" method="get" class="form-control w-full relative">
      <input name="search" type="text" placeholder="<?= translate($user, 'Search') ?>" value="<?= $searchTerm ?>" class="input input-bordered w-full" required>
      <button>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 absolute right-4 top-3 opacity-60">
          <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
        </svg>
      </button>
      </input>
    </form>
  </div>

  <!-- Right - User actions -->
  <div class="hidden flex-1 justify-end gap-4 md:flex">
    <div>
      <!-- Outbid notification -->
      <?php if ($notification || isset($data['id'])): ?>
        <a href="/catalog/product?id=<?php echo $notificationLink; ?>">
          <div role="alert" class="alert alert-warning">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
            <span>You have been outbid. Click to see.</span>
          </div>
        </a>
      <?php endif; ?>
    </div>
    <details class="dropdown dropdown-end">
      <summary class="m-1 btn">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 21l5.25-11.25L21 21m-9-3h7.5M3 5.621a48.474 48.474 0 016-.371m0 0c1.12 0 2.233.038 3.334.114M9 5.25V3m3.334 2.364C11.176 10.658 7.69 15.08 3 17.502m9.334-12.138c.896.061 1.785.147 2.666.257m-4.589 8.495a18.023 18.023 0 01-3.827-5.802" />
        </svg>
        <?php echo $languageDisplay; ?>
      </summary>
      <ul class="mt-2 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
        <form action="/src/lib/user/member/change-language.php" method="post">
          <li><input type="submit" name="text_en" value='English'></li>
          <li><input type="submit" name="text_nl" value='Nederlands'></li>
          <li><input type="submit" name="text_fr" value='Français'></li>
        </form>
      </ul>
    </details>
    <a class="btn" href="/chats/users">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 8.511c.884.284 1.5 1.128 1.5 2.097v4.286c0 1.136-.847 2.1-1.98 2.193-.34.027-.68.052-1.02.072v3.091l-3-3c-1.354 0-2.694-.055-4.02-.163a2.115 2.115 0 01-.825-.242m9.345-8.334a2.126 2.126 0 00-.476-.095 48.64 48.64 0 00-8.048 0c-1.131.094-1.976 1.057-1.976 2.192v4.286c0 .837.46 1.58 1.155 1.951m9.345-8.334V6.637c0-1.621-1.152-3.026-2.76-3.235A48.455 48.455 0 0011.25 3c-2.115 0-4.198.137-6.24.402-1.608.209-2.76 1.614-2.76 3.235v6.226c0 1.621 1.152 3.026 2.76 3.235.577.075 1.157.14 1.74.194V21l4.155-4.155" />
      </svg>
      <?= translate($user, 'Messages') ?>
    </a>
    <?php echo isset($_SESSION['user'])
      ? '
      <details class="dropdown dropdown-end">
        <summary class="m-1 btn btn-ghost btn-circle avatar">
          <div class="w-10 rounded-full">
            <img src="/public/images/' . $profileImage . '" />
          </div>
        </summary>
        <ul class="mt-2 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
          <!-- <li><a class="justify-between">Profile</a></li> -->
          <li><a href="/member/dashboard">' . translate($user, 'Account Overview') . '</a></li>
          <li><a href="/src/lib/user/member/change-theme.php">' . translate($user, 'Switch to ' . $theme . ' mode') . '</a></li>
          <li><a href="/seller/dashboard">' . translate($user, 'Storefront') . '</a></li>

          ' . $admin . '

          <div class="divider px-4 my-2"></div> 
          <li><a href="/account/logout"> ' . translate($user, 'Log out') . ' </a></li>
        </ul>
      </details>
      '
      : '<a href="/account/login" class="btn">Login</a>'; ?>

  </div>
</div>

<!-- Bottom navbar -->
<div class="hidden navbar bg-base-100 shadow-sm pt-8 md:flex">
  <div class="navbar-center flex w-full">
    <ul class="menu menu-horizontal px-1 gap-16 w-full justify-center">
      <?php
      $categories = fetch('SELECT * FROM product_categories LIMIT 10');
      if ($categories) {
        foreach ($categories as $category) {
          echo '
            <a href="/catalog/products?category=' . strtolower($category['name']) . '" class="group flex flex-col gap-2 items-center">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10 group-hover:-translate-y-1 transition">
                <path stroke-linecap="round" stroke-linejoin="round" d="' . $category['icon'] . '" />
              </svg>
              <span class="label-text">' . $category['name'] . '</span>
            </a>';
        }
      }

      $advert = fetch('SELECT * FROM advertisements ORDER BY RAND () LIMIT 1');
      if ($advert) {
        echo '
        <div class="flex justify-center items-center pt-12"> 
          <a href="../catalog/product?id=' . $advert['productid'] . '">
            <img style="border-radius: 25px;background-position: left top;background-repeat: repeat;padding: 20px;height: 125px;width: 970px;"
              alt="' . $advert['description'] .'"µ
              src="/public/advertisements/' .$advert['image'] . '" width="970" height="125">
          </a>
        </div>';
      }
      ?>
    </ul>
  </div>
</div>

<!-- PREDICTED LINES 150 -->
