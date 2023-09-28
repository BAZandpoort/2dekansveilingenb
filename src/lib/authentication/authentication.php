<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';

function register($username, $password, $email, $firstname, $lastname) {
  global $connection;
  $userData = insert(
    'INSERT INTO users (username, password, email, firstname, lastname) VALUES (?, ?, ?, ?, ?)',
    ['type' => 's', 'value' => $username],
    ['type' => 's', 'value' => $password],
    ['type' => 's', 'value' => $email],
    ['type' => 's', 'value' => $firstname],
    ['type' => 's', 'value' => $lastname],
  );

  $userId = mysqli_insert_id($connection);

  $userProfileData = insert(
    'INSERT INTO user_profile (userid, profilePictureUrl, about, theme) VALUES (?, ?, ?, ?)',
    ['type' => 'i', 'value' => $userId],
    ['type' => 's', 'value' => 'https://avatars.githubusercontent.com/u/64209400?v=4'],
    ['type' => 's', 'value' => 'Hello!'],
    ['type' => 's', 'value' => 'dark'],
  );

  return $userData && $userProfileData;
}

function login($email, $password) {
  var_dump($email, $password);
  $data = fetch(
    'SELECT * FROM user_profile
    JOIN users ON users.id = user_profile.userid 
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
