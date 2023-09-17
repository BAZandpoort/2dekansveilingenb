<?php
session_start();

if (!isset($_POST['login'])) {
  header('Location: /login');
  exit();
}

require_once '../../../config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/authentication/authentication.php';

if (!isset($_POST['email']) || !isset($_POST['password'])) {
  header('Location: /login?error=missing');
  return;
}

$email = $_POST['email'];
$password = $_POST['password'];

if (empty($email) || empty($password)) {
  header('Location: /login?error=empty');
  return;
}

$login = login($email, $password);

if (!$login) {
  header('Location: /login?error=invalid');
  return;
}

$_SESSION['user'] = USER_STRUCTURE;
$_SESSION['user']['id'] = $login['id'];
$_SESSION['user']['email'] = $login['email'];
$_SESSION['user']['username'] = $login['username'];

header('Location: /');
return;
