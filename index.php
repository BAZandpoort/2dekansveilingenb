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

$error = $_GET['error'] ?? false;
$succes = $_GET['success'] ?? false;
$alert = '';

if ($error) {
  $alert = '
    <div class="alert alert-error">
      <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
      <span>' . (ERROR_MAPPING[$error] ?? 'Something went wrong!') . '</span>
    </div>
  ';
}

if ($succes) {
  $alert = '
  <div class="alert alert-success">
    <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    <span>' . (SUCCES_MAPPING[$succes] ?? 'We think it worked!') . '</span>
  </div>
  ';
}

$containerClasses = $route['container'] ? 'container mx-auto pt-24 pb-48 md:px-16' : '';
?>

<!DOCTYPE html>
<html lang="en" data-theme='<?php echo $theme; ?>'>

<head>
  <script src="https://kit.fontawesome.com/58a210823e.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.tailwindcss.com"></script>

  <script src="/public/js/countdown.js"></script>
  <script src="/public/js/share.js"></script>
  <link rel="stylesheet" href="/public/css/theme.css">
  <title>2dekans veilingen - <?php echo $route['title']; ?></title>
</head>

<body>
  <div class="min-h-screen">
    <?php $route['nav'] ? include COMPONENTS . '/nav.php' : null; ?>

    <?php
    echo strlen($alert) > 0 
    ? '
    <div class="w-96 mx-auto mt-8">
      ' . $alert . '
    </div>
    ' 
    : null;
    ?>

    <div class="<?php echo $containerClasses ?>">
      <?php include PUBLIC_S . '/' . $route['view']; ?>
    </div>

    <?php $route['footer'] ? include COMPONENTS . '/footer.php' : null; ?>
  </div>
</body>
</html>