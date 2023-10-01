<?php

$routes = [
  '/' => [
    'view' => 'index.php',
    'title' => 'Home',
    'auth_roles' => [],
    'nav' => true,
    'footer' => true,
  ],
  // Account routes
  '/account/login' => [
    'view' => 'account/login.php',
    'title' => 'Login',
    'auth_roles' => ['guest'],
    'nav' => true,
    'footer' => true,
  ],
  '/account/logout' => [
    'view' => 'account/logout.php',
    'title' => 'Logout',
    'auth_roles' => ['member', 'admin'],
    'nav' => false,
    'footer' => false,
  ],
  '/account/register' => [
    'view' => 'account/register.php',
    'title' => 'Register',
    'auth_roles' => ['guest'],
    'nav' => true,
    'footer' => true,
  ],
  '/account/settings/edit' => [
    'view' => 'account/edit.php',
    'title' => 'Edit account settings',
    'auth_roles' => [],
    'nav' => true,
    'footer' => true,
  ],
  // Catalog routes
  '/catalog/products' => [
    'view' => 'catalog/products.php',
    'title' => 'Products',
    'auth_roles' => ['member', 'guest', 'admin'],
    'nav' => true,
    'footer' => true,
  ],
  // '/searchbar' => [
  //   'view' => 'zoekbalk.php',
  //   'title' => 'Search',
  //   'auth_roles' => ['member', 'guest', 'admin'],
  //   'nav' => true,
  //   'footer' => true,
  // ],
  // Member routes
  '/dashboard/products/add' => [
    'view' => 'member/addProduct.php',
    'title' => 'Add Products',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
  ],
  '/dashboard/products/mine' => [
    'view' => 'member/myProducts.php',
    'title' => 'My Products',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
  ],
  // Error routes
  '/404' => [
    'view' => 'errors/404.php',
    'title' => 'Not Found',
    'auth_roles' => [],
    'nav' => false,
    'footer' => false,
  ],
];
