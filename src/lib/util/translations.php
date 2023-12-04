<?php
function translate($user, $str) {
  $language = $user['language'];
  $data = fetch('SELECT * FROM translations WHERE text_en = ?', ['type' => 's', 'value' => $str]);

  return (empty($data) ? $str : $data[$language]);
}
