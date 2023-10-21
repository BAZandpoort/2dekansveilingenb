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
    'view' => 'account/settings.php',
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
  '/catalog/report' => [
    'view' => 'catalog/report.php',
    'title' => 'Report Abuse',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Member Dashboard routes
  '/dashboard/products/history' => [
    'view' => 'user/member/purchases.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Seller Dashboard routes
  '/dashboard/products/add' => [
    'view' => 'user/seller/add-product.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/products/own' => [
    'view' => 'user/seller/products.php',
    'title' => 'My Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Admin Dashboard routes
  '/dashboard/products/delete' => [
    'view' => 'user/admin/delete-product.php',
    'title' => 'Delete products',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  '/dashboard/translations' => [
    'view' => 'user/admin/translations.php',
    'title' => 'See translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/edit' => [
    'view' => 'user/admin/edit-translation.php',
    'title' => 'Edit translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/add' => [
    'view' => 'user/admin/add-translation.php',
    'title' => 'Add translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/reports' => [
    'view' => 'user/admin/reports.php',
    'title' => 'See reports',
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
    'container' => false,
  ],
];
