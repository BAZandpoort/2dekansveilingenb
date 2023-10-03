<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/authentication/authentication.php';

session_start();

if (isset($_POST['login'])) {
  login($_POST);
}

if (!isset($_POST['login'])) {
  header('Location: /account/login');
  exit();
}

function login($formData) {
  if (!isset($formData['email']) || !isset($formData['password'])) {
    header('Location: /account/login?error=missing');
    return;
  }
  
  $email = $formData['email'];
  $password = $formData['password'];
  
  if (empty($email) || empty($password)) {
    header('Location: /account/login?error=empty');
    return;
  }
  
  $auth = authenticate($email, $password);
  
  if (!$auth) {
    header('Location: /account/login?error=invalid');
    return;
  }
  
  $_SESSION['user'] = USER_STRUCTURE;
  $_SESSION['user']['id'] = $auth['id'];
  $_SESSION['user']['email'] = $auth['email'];
  $_SESSION['user']['username'] = $auth['username'];
  $_SESSION['user']['theme'] = $auth['theme'];
  
  header('Location: /');
}
return;
