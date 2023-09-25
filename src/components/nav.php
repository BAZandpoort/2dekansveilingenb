<div class="navbar bg-base-100 shadow-sm">
  <div class="navbar-start flex-1">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:hidden lg:flex">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" />
        </svg>
      </label>
    </div>
    <a href="/" class="btn btn-ghost normal-case text-xl">2dekans veilingen</a>
  </div>


  
  
  <div class="flex-none gap-2">
    <div class="form-control">
      <input type="text" placeholder="Search" class="input input-bordered w-24 md:w-auto" />
    </div>
    <div class="dropdown dropdown-end"> 
    </div>
  </div>



<div class="flex-1 justify-end">
  <div class="dropdown dropdown-end mr-4">
    <label tabindex="0" class="btn btn-ghost btn-circle">
    </label>
  </div>

    <?php echo isset($_SESSION['user'])
      ? '<div class="dropdown dropdown-end">
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
        <li><a>Settings</a></li>
        <li><a href="/logout"> logout</a></li>
        
      </ul>
    </div>'
      : '<a href="/login" class="btn"> Login</a>'; ?>
      </div>
</div>


<div class="navbar bg-base-100 shadow-sm mb-64">
  <div class="navbar-start flex-1">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:hidden lg:flex">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h8m-8 6h16" />
        </svg>
      </label>
    </div>
  </div>
  <div class="navbar-center hidden lg:flex">
    <ul class="menu menu-horizontal px-1">
      <label class="text">
    <a href="/veilingen" class="fa-solid fa-gavel fa-2xl" ></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Veilingen</span>
    <a href="/locatie" class="fa-solid fa-location-dot fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Locatie</span>
    <a href="/products" class="fa-solid fa-box-open fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Producten</span>
    <a href="/auto's" class="fa-solid fa-car-side fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Auto's</span>
    <a href="/kledij" class="fa-solid fa-shirt fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Kledij</span>
    <a href="/elektronica" class="fa-solid fa-mobile fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Elektronica</span>
    <a href="/huis" class="fa-solid fa-house fa-2xl"></a><span style="padding-left: 50px;"></span>
    <span class="label-text">Huis en inrichting</span>
      </label>  
  </div>


<div class="flex-1 justify-end">
  <div class="dropdown dropdown-end mr-4">
    <label tabindex="0" class="btn btn-ghost btn-circle">
    </label>
  </div>

</div>
</div>