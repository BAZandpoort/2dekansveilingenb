<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';



?>


<div class="min-h-[20svh] w-full flex flex-col justify-center items-center px-8 py-8">
  <div class="w-full flex justify-center text-sm breadcrumbs mb-2">
    <ul>
      <li><a href="/">Home</a></li>
      <li>Account</li>
    </ul>
  </div>

  <h1 class="md:text-center text-4xl font-bold mb-8">Add a new address</h1>

  <form action="/src/lib/user/seller/add-address.php" method="post" class="flex flex-col gap-8 w-full md:max-w-2xl">
    <div class="flex flex-col gap-4">
      <div class="form-control md:flex-1">
        <label class="label">
          <span class="label-text">Street</span>
        </label>
        <input type="text" id="streetName" name="streetName" placeholder="streetName" class="input input-bordered w-full" required />
      </div>

      <div class="form-control md:flex-1">
        <label class="label">
          <span class="label-text">House Number</span>
        </label>
        <input type="number" id="houseNumber" name="houseNumber" placeholder="House Number" class="input input-bordered w-full" required />
      </div>

      <div class="form-control md:flex-1">
    <label class="label">
        <span class="label-text">Postal Code</span>
    </label>
    <input type="text" id="postalcode" name="postalcode" placeholder="Postal Code" class="input input-bordered w-full" required maxlength="4" />
</div>

      <div class="form-control md:flex-1">
        <label class="label">
          <span class="label-text">Town</span>
        </label>
        <input type="text" id="town" name="town" placeholder="Town" class="input input-bordered w-full" required />
      </div>
    </div>

    <button name="addAddress" class="btn btn-primary">Add Address</button>
  </form>
</div>