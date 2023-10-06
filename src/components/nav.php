<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$userid = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;
$languageDisplay = '';

$languageMap = [
  'text_en' => 'English',
  'text_nl' => 'Nederlands',
  'text_fr' => 'Français'
];

if ($userid) {
  $query = 'SELECT * FROM user_profile WHERE userid = ?';
  $data = fetch($query, ['type' => 'i', 'value' => $userid]);

  $theme = $data['theme'] === 'dark' ? 'light' : 'dark';
  $language = $data['language'];
  $languageDisplay = $languageMap[$language];

  $english_link = "/src/lib/account/language-select.php?language=text_en";
  $nederlands_link = "/src/lib/account/language-select.php?language=text_nl";
  $francais_link = "/src/lib/account/language-select.php?language=text_fr";
} else {
  $english_link = "/src/public/account/language-select.php?language=text_en";
  $nederlands_link = "/src/public/account/language-select.php?language=text_nl";
  $francais_link = "/src/public/account/language-select.php?language=text_fr";

  if (!isset($_SESSION["guest_language"])){
    $_SESSION["guest_language"] = "text_en";
  }

  $language = $_SESSION["guest_language"];
  $languageDisplay = $languageMap[$language];
}

$query = 'SELECT id, '.$language.' FROM translations' ;
  $data = fetch($query);
?>

<!-- Top navbar -->
<div class="navbar bg-base-100 px-8">
  <!-- Left - logo -->
  <div class="navbar-start flex-1">
    <a href="/" class="btn btn-ghost normal-case text-xl"><?php echo $data[1][$language];?></a>
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
  <div class="flex-1 justify-end">
      <div class="dropdown dropdown-end">
          <label tabindex="0" class="btn m-1"><?php echo $languageDisplay ?></label>
          <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
            <li><a href=<?php echo $english_link?>>English</a></li>
            <li><a href=<?php echo $nederlands_link?>>Nederlands</a></li>
            <li><a href=<?php echo $francais_link?>>Français</a></li>
          </ul>
      </div>  
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
            <li><a class="justify-between">Profile</a></li>
            <li><a href="/src/lib/account/change-theme.php" >Switch to ' . $theme . '</a></li>
            <li><a href="/account/settings/edit">Settings</a></li>
            <li><a href="/account/logout"> ' . $data[2][$language] . ' </a></li>
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