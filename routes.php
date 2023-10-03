<?php

$routes = [
  '/' => [
    'view' => 'index.php',
    'title' => 'Home',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Account routes
  '/account/login' => [
    'view' => 'account/login.php',
    'title' => 'Login',
    'nav' => false,
    'footer' => false,
    'container' => false,
  ],
  '/account/logout' => [
    'view' => 'account/logout.php',
    'title' => 'Logout',
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
  '/account/register' => [
    'view' => 'account/register.php',
    'title' => 'Register',
    'nav' => false,
    'footer' => false,
    'container' => false,
  ],
  '/account/settings/edit' => [
    'view' => 'account/edit.php',
    'title' => 'Edit account settings',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Catalog routes
  '/catalog/products' => [
    'view' => 'catalog/products.php',
    'title' => 'Products',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Member routes
  '/dashboard/products/add' => [
    'view' => 'member/addProduct.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/products/mine' => [
    'view' => 'member/myProducts.php',
    'title' => 'My Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Error routes
  '/404' => [
    'view' => 'errors/404.php',
    'title' => 'Not Found',
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
];
