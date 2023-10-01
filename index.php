<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once ROUTES;
require_once LIB . '/util/util.php';

session_start();

$uri = explode('?', $_SERVER['REQUEST_URI'])[0];

$route = array_key_exists($uri, $routes) ? $routes[$uri] : $routes['/404'];

$userid = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;

$data = fetch('SELECT * FROM user_profile WHERE userid = ?', [
  'type' => 'i',
  'value' => $userid,
]);
$theme = $data ? THEME_MAPPING[$data['theme']] : THEME_MAPPING['default'];
?>


<!DOCTYPE html>
<html lang="en" data-theme='<?php echo $theme; ?>'>

<head>
  <script src="https://kit.fontawesome.com/58a210823e.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.tailwindcss.com"></script>

  <script src="/public/js/countdown.js"></script>
  <link rel="stylesheet" href="/public/css/theme.css">
  <title><?php echo $route['title']; ?></title>
</head>

<body>
  <div class="h-screen">
    <?php $route['nav'] ? include COMPONENTS . '/nav.php' : null; ?>

    <div class="container mx-auto pt-24 pb-48">
      <?php include PUBLIC_S . '/' . $route['view']; ?>
    </div>

    <?php $route['footer'] ? include COMPONENTS . '/footer.php' : null; ?>
  </div>
</body>
</html>