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
  $theme = $user["theme"];
  
  $language = $user['language'];
  $languageDisplay = $languageMap[$language];
} else {
  if (!isset($_SESSION["guest"]["language"])){
    $_SESSION["guest"]["language"] = "text_en";
  }

  $language = $_SESSION["guest"]["language"];
  $languageDisplay = $languageMap[$language];
}
?>

<!-- Top navbar -->
<div class="navbar bg-base-100 px-8">
  <!-- Left - logo -->
  <div class="navbar-start flex-1">
    <a href="/" class="btn btn-ghost normal-case text-xl"><?php echo $translations[1][$language];?></a>
  </div>

  <!-- Center - search -->
  <div class="flex-1">
    <div class="form-control w-full relative">
      <input type="text" placeholder="Search" class="input input-bordered w-auto">
        <i class="fa-solid fa-magnifying-glass fa-lg absolute right-4 top-1/2 opacity-60"></i>
      </input>
    </div>
  </div>

  <!-- Right - User actions -->
  <div class="flex-1 justify-end gap-4">
      <div class="dropdown dropdown-end">
          <label tabindex="0" class="btn m-1"><?php echo $languageDisplay ?></label>
          <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
            <form action="/src/lib/account/language-select.php" method="post">
              <li><input type="submit" name="text_en" value='English'></li>
              <li><input type="submit" name="text_nl" value='Nederlands'></li>
              <li><input type="submit" name="text_fr" value='Français'></li>
            </form>
          </ul>
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
            <li><a class="justify-between">Profile</a></li>
            <li><a href="/src/lib/account/change-theme.php" >Switch to ' . $theme . '</a></li>
            <li><a href="/account/settings/edit">Settings</a></li>
            <li><a href="/account/logout"> ' . $translations[2][$language] . ' </a></li>
          </ul>
        </div>
        '
      : '<a href="/account/login" class="btn">Login</a>'; ?>
  </div>
</div>

<!-- Bottom navbar -->
<div class="navbar bg-base-100 shadow-sm pt-8">
  <div class="navbar-center flex w-full">
    <ul class="menu menu-horizontal px-1 gap-16 w-full justify-center">
    <?php
        $categories = fetch('SELECT * FROM product_categories LIMIT 10');
        if ($categories) {
          foreach ($categories as $category) {
            echo '
            <a href="/catalog/products?category=' . $category['name'] . '" class="group flex flex-col gap-4 items-center">
              <i class="fa-solid ' . $category['icon'] . ' fa-2xl group-hover:-translate-y-1 transition"></i>
              <span class="label-text">' . $category['name'] . '</span>
            </a>
            ';
          }
        }
      ?>
    </ul>
  </div>
</div>