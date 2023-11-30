<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

if (isset($_POST['login'])) {
  session_start();
  login($_POST);
  return;
}

header('Location: /');
exit();

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
  $_SESSION['user']['id'] = $auth['users_id'];
  $_SESSION['user']['email'] = $auth['email'];
  $_SESSION['user']['username'] = $auth['username'];
  $_SESSION['user']['theme'] = $auth['theme'];
  $_SESSION['user']['language'] = $auth['language'];
  $_SESSION['user']['role'] = $auth['name'];
  
  header('Location: /');
  exit();
}

function authenticate($email, $password) {
  $data = fetch(
    'SELECT *, users.id AS users_id FROM user_profile
    JOIN users ON users.id = user_profile.userid
    JOIN user_role_mapping ON users.id = user_role_mapping.userid
    JOIN user_roles ON user_role_mapping.roleid = user_roles.id
    WHERE users.email = ?',
    [
      'type' => 's',
      'value' => $email,
    ],
  );

  if (!$data) {
    return false;
  }

  if (!password_verify($password, $data['password'])) {
    return false;
  }

  return $data;
}
