<?php 
  require "translations.php";
?>

<div class="navbar bg-base-100 shadow-sm mb-24">
  <div class="navbar-start">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:hidden">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" /></svg>
      </label>
      <?php
        echo '
          <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
            <li><a href="/">'.$translate["products"][$lng].'</a></li>
              <li>
                <a>'.$translate["categories"][$lng].'</a>
                <ul class="p-2 shadow-sm">
                  <li><a>Category 1</a></li>
                  <li><a>Category 2</a></li>
                </ul>
              </li>
            <li><a>'.$translate["profile"][$lng].'</a></li>
          </ul>
        ';
      ?>
      
    </div>
    <?php
      echo '
        <a href="/" class="btn btn-ghost normal-case text-xl">'.$translate["2nd-chance auctions"][$lng].'</a>
      ';
    ?>
  </div>
  <div class="navbar-center hidden lg:flex">
    <?php
      echo '
        <ul class="menu menu-horizontal px-1">
          <li><a href="/">'.$translate["products"][$lng].'</a></li>
          <li tabindex="0">
            <details>
              <summary>'.$translate["categories"][$lng].'</summary>
              <ul class="p-2 shadow-sm">
                <li><a>Category 1</a></li>
                <li><a>Category 2</a></li>
              </ul>
            </details>
          </li>
          <li><a>'.$translate["profile"][$lng].'</a></li>
        </ul>
      ';
    ?>
    
  </div>

  <div class="navbar-end">
    <a href="<?php echo isset($_SESSION['user'])
      ? '/logout'
      : '/login'; ?>" class="btn"><?php echo isset($_SESSION['user'])
  ? $translate["logout"][$lng]
  : $translate["login"][$lng]; ?></a>
  </div>

</div>