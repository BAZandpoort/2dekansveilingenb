<?php

if (!isset($_POST['register'])) {
  header('Location: /register');
  exit();
}

require_once '../../config.php';
require_once LIB . '/util.php';
require_once LIB . '/authentication.php';

$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];
$passwordConfirm = $_POST['passwordConfirm'];

$data = fetch('SELECT * FROM users WHERE email = ?', [
  'type' => 's',
  'value' => $email,
]);
if ($data) {
  header('Location: /register?error=email');
  exit();
}

$data = fetch('SELECT * FROM users WHERE username = ?', [
  'type' => 's',
  'value' => $username,
]);
if ($data) {
  header('Location: /register?error=username');
  exit();
}

if ($password !== $passwordConfirm) {
  header('Location: /register?error=password');
  exit();
}

$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
register($email, $username, $hashedPassword);

header('Location: /login');
