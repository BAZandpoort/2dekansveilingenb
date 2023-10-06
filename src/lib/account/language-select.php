<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();



$user = $_SESSION['user'];

$language = $user['language'];

insert(
  'UPDATE user_profile SET language = ? WHERE userid = ?',
  ['type' => 's', 'value' => $_GET['language']],
  ['type' => 'i', 'value' => $user['id']],
);

$_SESSION['user']['language'] = $language;

header('Location: /');