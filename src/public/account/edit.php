<?php
if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

$userId = $_SESSION['user']['id'];
$query = "SELECT * FROM users WHERE id = $userId";
$result = mysqli_query($connection, $query);
$user = mysqli_fetch_assoc($result);
if (isset($_SESSION['update_success'])) {
  echo '
    <div class="alert alert-success">
        <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
        <span>' .
    $_SESSION['update_success'] .
    '</span>
    </div>';
}

if (isset($_SESSION['no_changes'])) {
  echo '
    <div class="alert alert-info">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <span>' .
    $_SESSION['no_changes'] .
    '</span>
    </div>';
}
?>

<form action="/src/lib/account/update-profile.php" method="post" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user[
          'username'
        ]; ?>" required >

        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user[
          'email'
        ]; ?>" required>

        <label for="firstname">First Name</label>
        <input type="text" id="firstname" name="firstname"class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user[
          'firstname'
        ]; ?>" required>

        <label for="lastname">Last Name</label>
        <input type="text" id="lastname" name="lastname" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user[
          'lastname'
        ]; ?>" required>

        <input type="submit" value="Update Profile" class="btn btn-wide place-self-center">
    </div>
</form>
