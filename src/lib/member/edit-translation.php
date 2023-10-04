<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['edit'])) {
  $id = $_POST['id'];
  $english = $_POST['english'];
  $nederlands = $_POST['nederlands'];
  $français = $_POST['français'];

  $query = 'UPDATE translations SET (english = ?, nederlands = ?, français = ?) WHERE id = ?';

  $update = insert(
    $query, 
    ['type' => 's', 'value' => $english], 
    ['type' => 's', 'value' => $nederlands], 
    ['type' => 's', 'value' => $français], 
    ['type' => 'i', 'value' => $id]
  );

  return $update;
}
header('Location: /');
return;

