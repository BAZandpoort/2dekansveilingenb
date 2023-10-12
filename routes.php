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
  '/account/register' => [
    'view' => 'account/register.php',
    'title' => 'Register',
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
    'nav' => true,
    'footer' => true,
    'container' => false,
  ],
  '/catalog/product' => [
    'view' => 'catalog/product.php',
    'title' => 'Product',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  '/products/share' => [
    'view' => 'catalog/share.php',
    'title' => 'Products',
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
  // Seller Dashboard routes
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
  // Admin Dashboard routes
  '/dashboard/product-verwijderen' => [
    'view' => 'member/product-verwijderen.php',
    'title' => 'Delete products',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  '/dashboard/translations' => [
    'view' => 'member/translations.php',
    'title' => 'See translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/edit' => [
    'view' => 'member/edit-translation.php',
    'title' => 'Edit translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/add' => [
    'view' => 'member/add-translation.php',
    'title' => 'Add translations',
    'nav' => true,
    'footer' => false,
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
