<?php
session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

if (isset($_SESSION['user']) && isset($_POST['update'])) {
  updateProfile($_SESSION['user']['id'], $_POST);
  return;
}

header('Location: /');
exit();

function updateProfile($userId, $formData) {
  $query = 'SELECT * FROM users WHERE username = ?';
  $data = fetch($query, ['type' => 's', 'value' => $formData['username']]);

  if ($data && $data['id'] !== $userId) {
    header('Location: /account/settings/edit?error=usernameTaken');
    exit();
  }

  $newUsername = $formData['username'];
  $newEmail = $formData['email'];
  $newFirstname = $formData['firstname'];
  $newLastname = $formData['lastname'];
  $newProfilePicture = $_FILES['profilePicture'];
  
  $query = 'SELECT * FROM users WHERE id = ?';
  $data = fetch($query, ['type' => 'i', 'value' => $userId]);
  
  if (
    $data['username'] === $newUsername &&
    $data['email'] === $newEmail &&
    $data['firstname'] === $newFirstname &&
    $data['lastname'] === $newLastname &&
    $newProfilePicture['size'] === 0
  ) {
    header('Location: /account/settings/edit?error=noChanges');
    exit();
  }
  
  // Update user
  $query =
    'UPDATE users SET username = ?, email = ?, firstname = ?, lastname = ? WHERE id = ?';
  $updateUser = insert(
    $query,
    ['type' => 's', 'value' => $newUsername],
    ['type' => 's', 'value' => $newEmail],
    ['type' => 's', 'value' => $newFirstname],
    ['type' => 's', 'value' => $newLastname],
    ['type' => 's', 'value' => $userId],
  );

  // Update profile picture
  $query = "UPDATE user_profile SET profilepicture = ? WHERE userid = ?";

  $extension = pathinfo($newProfilePicture['name'], PATHINFO_EXTENSION);
  $imageName = uniqid() . '.' . $extension;
  $imageTmpName = $newProfilePicture['tmp_name'];

  $targetDir = PUBLIC_R . "/images/";
  $targetFile = $targetDir . $imageName;
  move_uploaded_file($imageTmpName, $targetFile);


  $updateProfilePicture = insert(
    $query,
    ['type' => 's', 'value' => $imageName],
    ['type' => 'i', 'value' => $userId],
  );
  
  if ($updateUser && $updateProfilePicture) {
    header('Location: /account/settings/edit?success=accountUpdate');
    exit();
  }
  
  header('Location: /account/settings/edit?error=accountUpdate');
  exit();
}
