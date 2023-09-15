<form action="/src/lib/register.php" method="post" class="flex flex-col items-center gap-4">
  <div class="flex flex-col gap-2 w-full max-w-xs">
    <label for="email">Email</label>
    <input
    name="email"
    id="email"
    type="email"
    placeholder="cats.are@best.com"
    class="input input-bordered w-full placeholder:opacity-30"
    required/>
  </div>
  
  <div class="flex flex-col gap-2 w-full max-w-xs">
    <label for="username">Username</label>
    <input
    name="username"
    id="username"
    type="text"
    placeholder="Cat"
    class="input input-bordered w-full placeholder:opacity-30"
    required />
  </div>
  
  <div class="flex flex-col gap-2 w-full max-w-xs">
    <label for="password">Password</label>
    <input
    name="password"
    id="password"
    type="password"
    placeholder="Secret..."
    class="input input-bordered w-full placeholder:opacity-30"
    required />
  </div>
  
  <div class="flex flex-col gap-2 w-full max-w-xs">
    <label for="passwordConfirm">Confirm password</label>
    <input
    name="passwordConfirm"
    id="passwordConfirm"
    type="password"
    placeholder="Secret... 2.0"
    class="input input-bordered w-full placeholder:opacity-30"
    required />
  </div>

  <input type="submit" name="register" value="register" class="btn btn-wide place-self-center">
</form>
