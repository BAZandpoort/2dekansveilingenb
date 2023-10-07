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
