<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['add'])) {
  $text_en = $_POST['text_en'];
  $text_nl = $_POST['text_nl'];
  $text_fr = $_POST['text_fr'];
  $location = $_POST['route'];

  $query = 'INSERT INTO translation (location, text_en, text_nl, text_fr) VALUES (?, ?, ?, ?)';
  insert(
    $query,
    ['type' => 's', 'value' => ''.$location.''],
    ['type' => 's', 'value' => ''.$text_en.''],
    ['type' => 's', 'value' => ''.$text_nl.''],
    ['type' => 's', 'value' => ''.$text_fr.''],
  );  
}
header('Location: /');
return;
