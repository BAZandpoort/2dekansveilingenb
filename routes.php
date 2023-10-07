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
    'container' => false,
  ],
  '/catalog/product' => [
    'view' => 'product.php',
    'title' => 'Product',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  '/catalog/bied' => [
    'view' => '/catalog/bied.php',
    'title' => 'bieden',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Dashboard routes
  '/dashboard/products/add' => [
    'view' => 'member/add-product.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/products/mine' => [
    'view' => 'member/personal-products.php',
    'title' => 'My Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Translation routes
  '/dashboard/translations' => [
    'view' => 'member/translations.php',
    'title' => 'See translations',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/edit' => [
    'view' => 'member/edit-translation.php',
    'title' => 'Edit translations',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/add' => [
    'view' => 'member/add-translation.php',
    'title' => 'Add translations',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Other
  '/products/share' => [
    'view' => 'catalog/product.php',
    'title' => 'Products',
    'auth_roles' => ['member', 'guest', 'admin'],
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
  // Error routes
  '/404' => [
    'view' => 'errors/404.php',
    'title' => 'Not Found',
    'nav' => false,
    'footer' => false,
    'container' => false,
  ],
];
