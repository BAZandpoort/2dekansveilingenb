<?php
function translate($user, $str) {
  $language = isset($user['language']) ? $user['language'] : $_SESSION['guest']['language'];
  $data = fetch('SELECT * FROM translations WHERE text_en = ?', ['type' => 's', 'value' => $str]);

  return (empty($data) ? $str : $data[$language]);
}
