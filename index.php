<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once ROUTES;
require_once LIB . '/util/util.php';

session_start();

$uri = explode('?', $_SERVER['REQUEST_URI'])[0];

$route = array_key_exists($uri, $routes) ? $routes[$uri] : $routes['/404'];

$userid = $_SESSION["user"] ? $_SESSION["user"]["id"] : null;
global $connection;

$sql = 'Select * From user_profile Where userid = ?';


$data = fetch($sql, ['type' => 'i', 'value' => $userid]);

?>

<!DOCTYPE html>
<!-- Dark: dark  Light: garden -->
<html lang="en" data-theme="<?php

  echo $data ? THEME_MAPPING[$data["mode"]] : THEME_MAPPING["default"];

  ?>">

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