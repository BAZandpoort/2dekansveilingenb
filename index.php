<?php
require_once 'config.php';
require_once DATABASE . '/connect.php';
require_once ROUTES;

$route = array_key_exists($_SERVER['REQUEST_URI'], $routes)
  ? $routes[$_SERVER['REQUEST_URI']]
  : $routes['/404'];

$_SESSION['token'] = 'whatever';
?>

<!DOCTYPE html>
<!-- Dark: dark  Light: garden -->
<html lang="en" data-theme="garden">

<head>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="./tailwind.config.js"></script>
  <title><?php echo $route['title']; ?></title>
</head>

<body>
  <div class="h-screen">
    <?php $route['nav'] ? include COMPONENTS . '/nav.php' : null; ?>

    <div class="container mx-auto">
      <?php include PUBLIC_S . '/' . $route['view']; ?>
    </div>

    <?php $route['footer'] ? include COMPONENTS . '/footer.php' : null; ?>
  </div>
</body>
</html>