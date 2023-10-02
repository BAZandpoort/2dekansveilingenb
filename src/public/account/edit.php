<?php
if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];
$query = "SELECT * FROM users WHERE users.id = ?";
$data = fetch($query, ['type' => 'i', 'value' => $userId]);

if (isset($_SESSION['update_success'])) {
  echo '
    <div class="alert alert-success">
        <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
        <span>' . $_SESSION['update_success'] . '</span>
    </div>';
}

if (isset($_SESSION['no_changes'])) {
  echo '
    <div class="alert alert-info">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <span>' . $_SESSION['no_changes'] . '</span>
    </div>';
}
?>

<h1 class="text-center text-4xl font-bold mb-12">Edit your account details</h1>

<form action="/src/lib/account/update-profile.php" method="post" class="flex flex-col items-center justify-center gap-4">
  <div class="flex flex-row justify-center gap-4 w-full">
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Username</span>
      </label>
      <input type="text" name="username" value="<?php echo $data['username']; ?>" class="input input-bordered w-full max-w-xs" required />
    </div>
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Email</span>
      </label>
      <input type="email" name="email" value="<?php echo $data['email']; ?>" class="input input-bordered w-full max-w-xs" required />
    </div>
  </div>

  <div class="flex flex-row justify-center gap-4 w-full">
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">First name</span>
      </label>
      <input type="text" name="firstname" value="<?php echo $data['firstname']; ?>" class="input input-bordered w-full max-w-xs" required />
    </div>
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Last name</span>
      </label>
      <input type="text" name="lastname" value="<?php echo $data['lastname']; ?>" class="input input-bordered w-full max-w-xs" required />
    </div>
  </div>

  <div class="form-control w-full max-w-xs">
    <button name="update" class="btn btn-primary">Update</button>
  </div>
</form>
