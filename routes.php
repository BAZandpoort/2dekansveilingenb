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
  '/account/login' => [ // Accessible
    'view' => 'account/login.php',
    'title' => 'Login',
    'nav' => false,
    'footer' => false,
    'container' => false,
  ],
  '/account/register' => [ // Accessible
    'view' => 'account/register.php',
    'title' => 'Register',
    'nav' => false,
    'footer' => false,
    'container' => false,
  ],
  '/account/logout' => [ // Accessible
    'view' => 'account/logout.php',
    'title' => 'Logout',
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
  '/account/settings/edit' => [ // Accessible
    'view' => 'account/edit.php',
    'title' => 'Edit account settings',
    'auth_roles' => [],
    'nav' => true,
    'footer' => true,
  ],
  // Catalog routes
  '/catalog/products' => [ // Accessible
    'view' => 'catalog/products.php',
    'title' => 'Products',
    'nav' => true,
    'footer' => true,
    'container' => false,
  ],
  '/catalog/product' => [ // Not Accessible
    'view' => 'catalog/product.php',
    'title' => 'Product',
    'nav' => true,
    'footer' => true,
    'container' => true,
  ],
  // Dashboard routes
  '/dashboard/products/add' => [ // Not Accessible
    'view' => 'member/add-product.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/products/mine' => [ // Not Accessible
    'view' => 'member/personal-products.php',
    'title' => 'My Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  // Translation routes
  '/dashboard/translations' => [ // Not Accessible
    'view' => 'member/translations.php',
    'title' => 'See translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/translations/edit' => [ // Not Accessible
    'view' => 'member/edit-translation.php',
    'title' => 'Edit translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/add/translations/add' => [ // Not Accessible
    'view' => 'member/add-translation.php',
    'title' => 'Add translations',
    'nav' => true,
    'footer' => false,
  ],
  // Other
  '/products/share' => [
    'view' => 'catalog/share.php',
    'title' => 'Products',
    'nav' => false,
    'footer' => false,
    'container' => true,
  ],
  '/dashboard/product-verwijderen' => [ // Not Accessible
    'view' => 'member/product-verwijderen.php',
    'title' => 'Delete products',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => true,
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
