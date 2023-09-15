<?php



if (isset($_SESSION['user'])) {
    session_destroy();
    header('Location: /');
} else {
    header('Location: /login');
    exit();
}