<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

session_start();

$_SESSION["guest_language"] = $_GET['language'];

header('Location: /');