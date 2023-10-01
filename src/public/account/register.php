<?php
if (isset($_SESSION['user'])) {
  header('Location: /');
  exit();
} ?>

<div class="pt-36">
  <div class="text-sm breadcrumbs flex justify-center">
    <ul>
      <li><a href="/">Home</a></li> 
      <li>Account</li>
      <li><a href="/account/register">Register</a></li>
    </ul>
  </div>

  <h1 class="text-center text-4xl font-bold mb-12">Create a new account</h1>

  <form action="/src/lib/account/register.php" method="post" class="flex flex-col items-center gap-6 max-w-2xl mx-auto">
    <div class="flex flex-row gap-4 w-full">
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Firstname</span>
        </label>
        <input type="text" name="firstname" placeholder="John" class="input input-bordered w-full max-w-xs" required />
      </div>
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Lastname</span>
        </label>
        <input type="text" name="lastname" placeholder="Doe" class="input input-bordered w-full max-w-xs" required />
      </div>
    </div>

    <div class="flex flex-row gap-4 w-full">
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Email</span>
        </label>
        <input type="email" name="email" placeholder="john.doe@gmail.com" class="input input-bordered w-full max-w-xs" required />
      </div>
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Username</span>
        </label>
        <input type="text" name="username" placeholder="john.doe" class="input input-bordered w-full max-w-xs" required />
      </div>
    </div>

    <div class="flex flex-row gap-4 w-full">
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Password</span>
        </label>
        <input type="password" name="password" placeholder="Make it a good one!" class="input input-bordered w-full max-w-xs" required />
      </div>
      <div class="form-control w-full max-w-xs flex-1">
        <label class="label">
          <span class="label-text">Confirm password</span>
        </label>
        <input type="password" name="passwordConfirm" placeholder="Repeat..." class="input input-bordered w-full max-w-xs" required />
      </div>
    </div>

    <div class="form-control w-full max-w-xs">
      <button name="register" class="btn btn-primary">Register</button>
    </div>
  </form>

  <div class="w-full text-center mt-8">
    <a class="link" href="/account/login">I already have an account</a>
  </div>
</div>
