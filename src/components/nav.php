<?php
  if (!isset($_SESSION["lang"])){
    $_SESSION["lang"] = 0;
  }
?>

<div class="navbar bg-base-100 shadow-sm mb-24">
  <div class="navbar-start">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:hidden">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" /></svg>
      </label>
      <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
        <li><a href="/">Products</a></li>
        <li>
          <a>Categories</a>
          <ul class="p-2 shadow-sm">
            <li><a>Category 1</a></li>
            <li><a>Category 2</a></li>
          </ul>
        </li>
        <li><a>Profile</a></li>
      </ul>
    </div>
    <a href="/" class="btn btn-ghost normal-case text-xl">2dekans veilingen</a>
  </div>
  <div class="navbar-center hidden lg:flex">
    <ul class="menu menu-horizontal px-1">
      <li><a href="/">Products</a></li>
      <li tabindex="0">
        <details>
          <summary>Categories</summary>
          <ul class="p-2 shadow-sm">
            <li><a>Category 1</a></li>
            <li><a>Category 2</a></li>
          </ul>
        </details>
      </li>
      <li><a>Profile</a></li>
    </ul>
  </div>
  
  <div class="navbar-end">
    <a href="<?php echo isset($_SESSION['user'])
      ? '/logout'
      : '/login'; ?>" class="btn"><?php echo isset($_SESSION['user'])
  ? 'Logout'
  : 'Login'; ?></a>
  </div>

</div>