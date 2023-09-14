<?php

$routes = [
  '/404' => [
    'view' => '404.php',
    'title' => 'Not Found',
    'auth_roles' => [],
    'nav' => false,
    'footer' => false,
  ],
  '/' => [
    'view' => 'index.php',
    'title' => 'Home',
    'auth_roles' => [],
    'nav' => true,
    'footer' => true,
  ],
  '/register' => [
    'view' => 'register.php',
    'title' => 'Register',
    'auth_roles' => ['guest'],
    'nav' => true,
    'footer' => true,
  ],
  '/about' => [
    'view' => 'about.php',
    'title' => 'About',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => true,
  ],
  '/admin' => [
    'view' => 'about.php',
    'title' => 'About',
    'auth_roles' => ['admin'],
    'nav' => true,
    'footer' => true,
  ],
];
