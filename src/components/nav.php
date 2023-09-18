<div class="navbar bg-base-100">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-xl">daisyUI</a>
  </div>
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

  <div class="flex-none gap-2">
    <div class="form-control">
      <input type="text" placeholder="Search" class="input input-bordered w-24 md:w-auto" />
    </div>  
    <div class="navbar bg-base-100">
  <div class="flex-none gap-2">

  <div class="flex-none">
    <div class="dropdown dropdown-end">
      <label tabindex="0" class="btn btn-ghost btn-circle">
        <div class="indicator">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
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
    <div class="dropdown dropdown-end">
      <label tabindex="0" class="btn btn-ghost btn-circle avatar">
        <div class="w-10 rounded-full">
          <img src="/images/stock/photo-1534528741775-53994a69daeb.jpg" />
        </div>
      </label>
      <ul tabindex="0" class="mt-3 z-[1] p-2 shadow menu menu-sm dropdown-content bg-base-100 rounded-box w-52">
        <li>
          <a class="justify-between">
            Profile
          </a>
        </li>
        <li><a>Settings</a></li>  
         <div class="navbar-end">
          <a href="<?php echo isset($_SESSION['user'])
           ? '/logout'
           : '/login'; ?>" class="badge"><?php echo isset($_SESSION['user'])
           ? 'Logout'
           : 'Login'; ?></a>
           </div>
          </div>
      </ul>
    </div>
  </div>
</div>
</div>
</div>
</div>
