<?php

if (!isset($_POST['register'])) {
  header('Location: /register');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once LIB . '/authentication/authentication.php';

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

$password = password_hash($password, PASSWORD_DEFAULT);
register($email, $username, $password);

header('Location: /login');
