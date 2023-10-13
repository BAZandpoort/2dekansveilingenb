<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

$languageDisplay = '';
$languageMap = [
  'text_en' => 'English',
  'text_nl' => 'Nederlands',
  'text_fr' => 'Français'
];

if ($user) {
  $theme = ($user["theme"] === 'dark') ? 'light' : 'dark';
  
  $language = $user['language'];
  $languageDisplay = $languageMap[$language];
} else {
  if (!isset($_SESSION["guest"]["language"])){
    $_SESSION["guest"]["language"] = "text_en";
  }

  $language = $_SESSION["guest"]["language"];
  $languageDisplay = $languageMap[$language];
}

$searchTerm = $_GET['search'] ?? '';
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
        <?php
        echo isset($_SESSION['user'])
          ? '
          <li>
            <details>
              <summary class="text-lg">
              <div class="w-8">
                <img class="rounded-full" src="https://avatars.githubusercontent.com/u/64209400?v=4" />
              </div>
              Account
              </summary>
              <ul>
                <li><a class="justify-between">Profile</a></li>
                <li><a href="/src/lib/user/member/change-theme.php" >Switch to ' . $theme . '</a></li>
                <li><a href="/account/settings/edit">Settings</a></li>
                <li><a href="/account/logout"> ' . $translations[2][$language] . ' </a></li>
              </ul>
            </details>
          </li>
          '
          : '<li><a href="/account/login" class="text-lg">Login</a></li>'
        ?>
        <!-- Language Select -->
        <li>
          <details>
            <summary class="text-lg"><?php echo $languageDisplay ?></summary>
            <ul>
              <form action="/src/lib/user/member/change-language.php" method="post">
                <li><input type="submit" name="text_en" value='English'></li>
                <li><input type="submit" name="text_nl" value='Nederlands'></li>
                <li><input type="submit" name="text_fr" value='Français'></li>
              </form>
            </ul>
          </details>
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
                    </li>
                    ';
                  }
                }
              ?>
            </ul>
          </details>
        </li>
      </ul>
    </div>

    <a href="/" class="hidden btn btn-ghost normal-case text-xl md:flex"><?php echo $translations[1][$language];?></a>
  </div>

  <!-- Center - search -->
  <div class="w-full md:flex-1">
    <form action="/catalog/products" method="get" class="form-control w-full relative">
      <input name="search" type="text" placeholder="Search" value="<?= $searchTerm ?>" class="input input-bordered w-full" required>
        <button>
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 absolute right-4 top-3 opacity-60">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
          </svg>
        </button>
      </input>
      <!-- <button name="search" class="btn btn-primary">Zoeken</button> -->
    </form>
  </div>

  <!-- Right - User actions -->
  <div class="hidden flex-1 justify-end gap-4 md:flex">
    <details class="dropdown dropdown-end">
      <summary class="m-1 btn"><?php echo $languageDisplay ?></summary>
      <ul class="mt-2 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
        <form action="/src/lib/user/member/change-language.php" method="post">
          <li><input type="submit" name="text_en" value='English'></li>
          <li><input type="submit" name="text_nl" value='Nederlands'></li>
          <li><input type="submit" name="text_fr" value='Français'></li>
        </form>
      </ul>
    </details>
    <?php echo isset($_SESSION['user'])
      ? '
      <details class="dropdown dropdown-end">
        <summary class="m-1 btn btn-ghost btn-circle avatar">
          <div class="w-10 rounded-full">
            <img src="https://avatars.githubusercontent.com/u/64209400?v=4" />
          </div>
        </summary>
        <ul class="mt-2 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
          <li><a class="justify-between">Profile</a></li>
          <li><a href="/src/lib/user/member/change-theme.php" >Switch to ' . $theme . '</a></li>
          <li><a href="/account/settings/edit">Settings</a></li>
          <div class="divider px-4 my-2"></div> 
          <li><a href="/account/logout"> ' . $translations[2][$language] . ' </a></li>
          <div class="divider px-4 mb-2">TEMP</div>
          <li>
            <details class="dropdown dropdown-left">
              <summary class="m-1">Member Dashboard</summary>
              <ul class="mr-4 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
                <li><a href="/dashboard/products/history">Purchase history</a></li>
              </ul>
            </details>
          </li>
          <li>
            <details class="dropdown dropdown-left">
              <summary class="m-1">Seller Dashboard</summary>
              <ul class="mr-4 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
                <li><a href="/dashboard/products/add">Add product</a></li>
                <li><a href="/dashboard/products/own">My products</a></li>
              </ul>
            </details>
          </li>
          <li>
            <details class="dropdown dropdown-left">
              <summary class="m-1">Admin Dashboard</summary>
              <ul class="mr-4 p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
                <li><a href="/dashboard/products/delete">Remove products</a></li>
                <li>
                  <details class="dropdown dropdown-bottom">
                    <summary class="m-1">Translations</summary>
                    <ul class="p-2 shadow menu dropdown-content z-[1] bg-base-200 rounded-box w-52">
                      <li><a href="/dashboard/translations">View translations</a></li>
                      <li><a href="/dashboard/translations/add">Add translations</a></li>
                    </ul>
                  </details>
                </li>
              </ul>
            </details>
          </li>
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
            <a href="/catalog/products?category=' . $category['name'] . '" class="group flex flex-col gap-2 items-center">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10 group-hover:-translate-y-1 transition">
                <path stroke-linecap="round" stroke-linejoin="round" d="' . $category['icon'] . '" />
              </svg>
              <span class="label-text">' . $category['name'] . '</span>
            </a>
            ';
          }
        }
      ?>
    </ul>
  </div>
</div>


