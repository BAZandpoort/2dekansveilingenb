<style>
  .text {
  text-align: center;
  display: inline-block;
  width: 100px;
  height: 100px;
  margin: 0 10px;
  }


</style>

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
    <div class="text">
      <a href="/veilingen" class="fa-solid fa-gavel fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Veilingen</span>
    </div>
    <div class="text">
      <a href="/locatie" class="fa-solid fa-location-dot fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Locatie</span>
    </div>
    <div class="text">
      <a href="/products" class="fa-solid fa-box-open fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Producten</span>
    </div>
    <div class="text">
      <a href="/auto's" class="fa-solid fa-car-side fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Auto's</span>
    </div>
    <div class="text">
      <a href="/kledij" class="fa-solid fa-shirt fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Kledij</span>
    </div>
    <div class="text">
      <a href="/elektronica" class="fa-solid fa-mobile fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Elektronica</span>
    </div>
    <div class="text">
      <a href="/huis" class="fa-solid fa-house fa-2xl" style="display: block;"></a><br>
      <span class="label-text" style="display: block;">Huis en inrichting</span>
    </div>  
  </ul>
</div>


<div class="flex-1 justify-end">
  <div class="dropdown dropdown-end mr-4">
    <label tabindex="0" class="btn btn-ghost btn-circle">
    </label>
  </div>

</div>
</div>