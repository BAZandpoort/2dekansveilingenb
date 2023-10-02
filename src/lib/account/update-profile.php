<?php
session_start();

if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];

$newUsername = $_POST['username'];
$newEmail = $_POST['email'];
$newFirstname = $_POST['firstname'];
$newLastname = $_POST['lastname'];

$query = 'SELECT * FROM users WHERE id = ?';
$data = fetch($query, ['type' => 'i', 'value' => $userId]);

if (
  $data['username'] === $newUsername &&
  $data['email'] === $newEmail &&
  $data['firstname'] === $newFirstname &&
  $data['lastname'] === $newLastname
) {
  header('Location: /account/settings/edit?error=noChanges');
  exit();
}

$query =
  'UPDATE users SET username = ?, email = ?, firstname = ?, lastname = ? WHERE id = ?';
$update = insert(
  $query,
  ['type' => 's', 'value' => $newUsername],
  ['type' => 's', 'value' => $newEmail],
  ['type' => 's', 'value' => $newFirstname],
  ['type' => 's', 'value' => $newLastname],
  ['type' => 's', 'value' => $userId],
);

if ($update) {
  header('Location: /account/settings/edit?success=accountUpdate');
  exit();
}

header('Location: /account/settings/edit?error=accountUpdate');
exit();
?>
