<?php
session_start();

if (!isset($_POST["login"])) {
    header("Location: /login");
    exit();
}

require_once '../../config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/authentication.php';

if (!isset($_POST['email']) || !isset($_POST['password'])) {
    header("Location: /login?error=missing");
    exit();
}

$email = $_POST['email'];
$password = $_POST['password'];

if (empty($email) || empty($password)) {
    header("Location: /login?error=empty");
    exit();
}

$login = login($email, $password);

if ($login) {

    $_SESSION['user'] = USER_STRUCTURE;

    $_SESSION['user']['id'] = $login['id'];
    $_SESSION['user']['email'] = $login['email'];
    $_SESSION['user']['username'] = $login['username'];

    header("Location: /");
    exit();
} else {
    header("Location: /login?error=invalid");
    exit();
}

