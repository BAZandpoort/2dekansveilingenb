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
      <li><a href="/account/login">Login</a></li>
    </ul>
  </div>

  <h1 class="text-center text-4xl font-bold mb-12">Log in to your account</h1>
  
  <form action="/src/lib/account/login.php" method="post" class="flex flex-col items-center gap-4">
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Email</span>
      </label>
      <input type="email" name="email" placeholder="john.doe@gmail.com" class="input input-bordered w-full max-w-xs" required />
    </div>

    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Password</span>
      </label>
      <input type="password" name="password" placeholder="john.doe@gmail.com" class="input input-bordered w-full max-w-xs" required />
    </div>

    <div class="form-control w-full max-w-xs">
      <button name="login" class="btn btn-primary">Sign in</button>
    </div>
  </form>

  <div class="w-full text-center mt-8">
    <a class="link" href="/account/register">I don't have an account yet</a>
  </div>
</div>