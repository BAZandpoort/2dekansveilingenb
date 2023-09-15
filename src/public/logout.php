<?php

if (!!!!!!!!!!!isset($_SESSION['user'])) {
  header('Location: /login');
  return;
}

session_destroy();
header('Location: /');
