<?php
if (isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}
?>

<div>
  <form action="/src/lib/account/login.php" method="post" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="email">Email</label>
      <input name="email" id="email" type="email" placeholder="cats.are@best.com" class="input input-bordered w-full placeholder:opacity-30" required />
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="password">Password</label>
      <input name="password" id="password" type="password" placeholder="Secret..." class="input input-bordered w-full placeholder:opacity-30" required />
    </div>

    <input type="submit" name="login" value="login" class="btn btn-wide place-self-center">
  </form>

  <div class="w-full text-center mt-8">
    <a class="link" href="/account/register">I don't have an account yet</a>
  </div>
</div>