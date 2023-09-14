<?php

require_once '../../config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util.php';

function register($email, $username, $password, $passwordConfirm) {
  $data = fetch('SELECT * FROM users WHERE email = ?', [
    'type' => 's',
    'value' => $email,
  ]);
  if ($data) {
    echo 'Email already registered';
    return;
  }

  $data = fetch('SELECT * FROM users WHERE username = ?', [
    'type' => 's',
    'value' => $username,
  ]);
  if ($data) {
    echo 'Username already exists';
    return;
  }

  if ($password !== $passwordConfirm) {
    echo 'Passwords do not match';
    return;
  }

  $password = password_hash($password, PASSWORD_ARGON2ID);

  $data = insert(
    'INSERT INTO users (username, password, email) VALUES (?, ?, ?)',
    ['type' => 's', 'value' => $username],
    ['type' => 's', 'value' => $password],
    ['type' => 's', 'value' => $email],
  );

  return $data;
}

function login($email, $password) {
  $data = fetch('SELECT * FROM users WHERE email = ?', [
    'type' => 's',
    'value' => $email,
  ]);
  if (!$data) {
    echo 'Email not registered';
    return;
  }

  if (!password_verify($password, $data['password'])) {
    echo 'Incorrect password';
    return;
  }

  echo 'successfully logged in, ' . $data['username'] . '!';
  return $data;
}
