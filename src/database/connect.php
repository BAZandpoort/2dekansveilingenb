<?php
require_once __DIR__ . '/../../config.php';

try {
  $conn = new PDO(
    'mysql:host=' . DB_SERVER . ';dbname=' . DB_NAME,
    DB_USERNAME,
    DB_PASSWORD,
  );
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $exception) {
  echo 'Connection failed: ' . $exception->getMessage();
}
?>
