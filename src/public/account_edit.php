 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Settings</title>
</head>
<body>
    
    <?php 

if (!isset($_SESSION['user'])) {
    header('Location: /');
    exit();
  } else{
   require_once($_SERVER['DOCUMENT_ROOT'] . '/config.php');
   require_once DATABASE . '/connect.php';

  
        $userId= $_SESSION['user']['id'];
    $query = "SELECT * FROM users WHERE id = $userId";
    $result = mysqli_query($connection, $query);
    $user = mysqli_fetch_assoc($result);
  }
    ?>


<div>
    <form action="/update" method="post" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user['username']; ?>" required ><br><br>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user['email']; ?>" required><br><br>

        <label for="firstname">First Name</label>
        <input type="text" id="firstname" name="firstname"class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user['firstname']; ?>" required><br><br>

        <label for="lastname">Last Name</label>
        <input type="text" id="lastname" name="lastname" class="input input-bordered w-full placeholder:opacity-30" value="<?php echo $user['lastname']; ?>" required><br><br>

        <input type="submit" value="Update Profile" class="btn btn-wide place-self-center">
        </div>
    </form>
    <div class="w-full text-center mt-8">

  </div>
</div>
</body>
</html>