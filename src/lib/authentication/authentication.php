<?php

require_once '../../../config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

function register($username, $password, $email, $firstname, $lastname) {
  $data = insert(
    'INSERT INTO users (username, password, email, firstname, lastname) VALUES (?, ?, ?, ?, ?)',
    ['type' => 's', 'value' => $username],
    ['type' => 's', 'value' => $password],
    ['type' => 's', 'value' => $email],
    ['type' => 's', 'value' => $firstname],
    ['type' => 's', 'value' => $lastname],
  );

  return $data;
}

function login($email, $password) {
  $data = fetch('SELECT * FROM users WHERE email = ?', [
    'type' => 's',
    'value' => $email,
  ]);

  if (!$data) {
    return false;
  }

  if (!password_verify($password, $data['password'])) {
    return false;
  }

  return $data;
}
