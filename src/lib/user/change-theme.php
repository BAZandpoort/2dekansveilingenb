<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$user = $_SESSION['user'];

$mode = $user['mode'] === 'dark' ? 'light' : 'dark';
insert(
  'UPDATE user_profile SET mode = ? WHERE userid = ?',
  ['type' => 's', 'value' => $mode],
  ['type' => 'i', 'value' => $user['id']],
);

$_SESSION['user']['mode'] = $mode;

header('Location: /');
