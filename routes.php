<?php

$routes = [
  '/' => [
    'view' => 'index.php',
    'title' => 'Home',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => [],
  ],
  '/user/profile' => [
    'view' => 'user/member/profile.php',
    'title' => 'Profile',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  // Account routes
  '/account/login' => [
    'view' => 'account/login.php',
    'title' => 'Login',
    'nav' => false,
    'footer' => false,
    'container' => false,
    'auth' => [],
  ],
  '/account/register' => [
    'view' => 'account/register.php',
    'title' => 'Register',
    'nav' => false,
    'footer' => false,
    'container' => false,
    'auth' => [],
  ],
  '/account/logout' => [
    'view' => 'account/logout.php',
    'title' => 'Logout',
    'nav' => false,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/account/settings/edit' => [
    'view' => 'account/settings.php',
    'title' => 'Edit account settings',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],

  // Catalog routes
  '/catalog/products' => [
    'view' => 'catalog/products.php',
    'title' => 'Products',
    'nav' => true,
    'footer' => true,
    'container' => false,
    'auth' => [],
  ],
  '/catalog/product' => [
    'view' => 'catalog/product.php',
    'title' => 'Product',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => [],
  ],
  // chat routes
  '/chats/users' => [
    'view' => '/chats/users.php',
    'title' => 'chat',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/chats/chat' => [
    'view' => 'chats/chat.php',
    'title' => 'chat',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  // product share
  '/products/share' => [
    'view' => 'catalog/share.php',
    'title' => 'Products',
    'nav' => false,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/catalog/report' => [
    'view' => 'catalog/report.php',
    'title' => 'Report Abuse',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/catalog/delivery_order' => [
    'view' => 'catalog/delivery_order.php',
    'title' => 'Delivery order',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  // Member Dashboard routes
  '/dashboard/products/history' => [
    'view' => 'user/member/purchases.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/dashboard/products/review' => [
    'view' => 'user/member/review.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  // Seller Dashboard routes
  '/dashboard/products/add' => [
    'view' => 'user/seller/add-product.php',
    'title' => 'Add Products',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/seller/dashboard' => [
    'view' => 'user/seller/dashboard.php',
    'title' => 'Dashboard',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/seller/dashboard/edit' => [
    'view' => 'user/seller/edit-product.php',
    'title' => 'Edit Product',
    'auth_roles' => ['member'],
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/seller/add-advertisement' => [
    'view' => 'user/seller/add-advertisement.php',
    'title' => 'Dashboard',
    'nav' => true,
    'footer' => true,
    'container' => false,
    'auth' => ['member', 'admin'],
  ],
  '/seller/add-address' => [
    'view' => 'user/seller/add-address.php',
    'title' => 'Dashboard',
    'nav' => true,
    'footer' => true,
    'container' => false,
    'auth' => ['member', 'admin'],
  ],
  '/seller/hide-address' => [
    'view' => 'user/seller/hide-address.php',
    'title' => 'Dashboard', 
    'nav' => true,
    'footer' => false,
    'container' => false,
    'auth' => ['member', 'admin'],
  ],
  // Admin Dashboard routes
  '/dashboard/products/delete' => [
    'view' => 'user/admin/delete-product.php',
    'title' => 'Delete products',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/dashboard/translations' => [
    'view' => 'user/admin/translations.php',
    'title' => 'See translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/dashboard/translations/edit' => [
    'view' => 'user/admin/edit-translation.php',
    'title' => 'Edit translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/dashboard/translations/add' => [
    'view' => 'user/admin/add-translation.php',
    'title' => 'Add translations',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/member/dashboard' => [
    'view' => 'user/member/dashboard.php',
    'title' => 'Member Dashboard',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/dashboard/reports' => [
    'view' => 'user/admin/reports.php',
    'title' => 'See reports',
    'nav' => true,
    'footer' => false,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/admin/dashboard' => [
    'view' => 'user/admin/dashboard.php',
    'title' => 'My Products',
    'nav' => false,
    'footer' => false,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/dashboard/products/time/edit' => [
    'view' => 'user/seller/edit-time.php',
    'title' => 'Update timer',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['admin'],
  ],
  '/account/favorites' => [
    'view' => 'account/favorites.php',
    'title' => 'Favorite',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  '/chatbot/chatbot' => [
    'view' => 'chatbot/chatbot.php',
    'title' => 'Chatbot',
    'nav' => true,
    'footer' => true,
    'container' => true,
    'auth' => ['member', 'admin'],
  ],
  // Error routes
  '/404' => [
    'view' => 'errors/404.php',
    'title' => 'Not Found',
    'nav' => false,
    'footer' => false,
    'container' => false,
    'auth' => ['member', 'admin'],
  ],
];
