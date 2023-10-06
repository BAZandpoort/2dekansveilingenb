<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

if (isset($_POST['edit'])) {
  $id = $_POST['id'];
  $text_en = $_POST['text_en'];
  $text_nl = $_POST['text_nl'];
  $text_fr = $_POST['text_fr'];

  $query = 'UPDATE translations SET text_en = ?, text_nl = ?, text_fr = ? WHERE id = ?';

  insert(
    $query, 
    ['type' => 's', 'value' => ''.$text_en.''], 
    ['type' => 's', 'value' => ''.$text_nl.''], 
    ['type' => 's', 'value' => ''.$text_fr.''], 
    ['type' => 'i', 'value' => $id]
  );  
}
header('Location: /dashboard/see-translations');
return;
?>
