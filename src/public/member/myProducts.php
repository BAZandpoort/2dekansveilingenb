<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once LIB . '/catalog/products.php';

$userid = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;
$query = 'SELECT * FROM products WHERE userid = ?';
$data = fetch($query, ['type' => 'i', 'value' => $userid]);

if (!isset($data['id'])) {
  echo '
        <div class="alert alert-info">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
            <span>U Hebt nog geen items om te verkopen</span>
        </div>
    ';
  return;
}

userProducts($userid);
