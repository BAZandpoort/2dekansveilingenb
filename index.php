<?php
date_default_timezone_set('Europe/Brussels');

require $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require DATABASE . '/connect.php';
require ROOT . '/router.php';
require ROUTES;
require LIB . '/util/util.php';

session_start();


// $ip, $screen_resolution, $user_agent, $accept_language, $accept_encoding
$browserFingerprint = generateFingerprint(
  $_SERVER['REMOTE_ADDR'],
  '1920x1080', // TODO: get screen resolution
  $_SERVER['HTTP_USER_AGENT'],
  $_SERVER['HTTP_ACCEPT_LANGUAGE'],
  $_SERVER['HTTP_ACCEPT_ENCODING']
);

if (!isset($_SESSION['fingerprint'])) {
  $_SESSION['fingerprint'] = $browserFingerprint;
} else if ($_SESSION['fingerprint'] !== $browserFingerprint) {
  $_SESSION['fingerprint'] = $browserFingerprint;
  session_destroy();
}



// $ip, $screen_resolution, $user_agent, $accept_language, $accept_encoding
$browserFingerprint = generateFingerprint(
  $_SERVER['REMOTE_ADDR'],
  '1920x1080', // TODO: get screen resolution
  $_SERVER['HTTP_USER_AGENT'],
  $_SERVER['HTTP_ACCEPT_LANGUAGE'],
  $_SERVER['HTTP_ACCEPT_ENCODING']
);

if (!isset($_SESSION['fingerprint'])) {
  $_SESSION['fingerprint'] = $browserFingerprint;
} else if ($_SESSION['fingerprint'] !== $browserFingerprint) {
  $_SESSION['fingerprint'] = $browserFingerprint;
  session_destroy();
}


$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$route = handleRoute($uri, $routes);

$user = $_SESSION['user'] ?? false;
$hasAccess = ($user && (in_array($_SESSION['user']['role'], $route['auth']) || $route['auth'] === [])) ?? false;

if (!$user) {
  if ($route['auth'] !== []) {
    header('Location: /');
    exit;
  }
} else {
  if (!$hasAccess) {
    header('Location: /');
    exit;
  }
} 

// // THEME HANDLING
// $data = fetch('SELECT * FROM user_profile WHERE userid = ?', [
//   'type' => 'i',
//   'value' => $userid,
// ]);
// $theme = $data ? THEME_MAPPING[$data['theme']] : THEME_MAPPING['default'];

// // ALERT HANDLING
// $error = $_GET['error'] ?? false;
// $succes = $_GET['success'] ?? false;
// $alert = '';

// if ($error) {
//   $alert = '
//     <div class="alert alert-error w-fit grid-flow-col md:pr-6">
//       <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
//         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
//       </svg>
//       <span>' . (ERROR_MAPPING[$error] ?? 'Something went wrong!') . '</span>
//     </div>
//     <script>
//     setTimeout(function() {
//       var alerts = document.querySelectorAll(".alert");
//       alerts.forEach(function(alert) {
//         alert.style.display = "none";
//       });
//     }, 5000);
//   </script>
//   ';
// }

// if ($succes) {
//   $alert = '
//   <div class="alert alert-success w-fit grid-flow-col md:pr-6">
//     <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
//       <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
//     </svg>
//     <span>' . (SUCCES_MAPPING[$succes] ?? 'We think it worked!') . '</span>
//   </div>
//   <script>
//     setTimeout(function() {
//       var alerts = document.querySelectorAll(".alert");
//       alerts.forEach(function(alert) {
//         alert.style.display = "none";
//       });
//     }, 2000);
//   </script>
//   ';

// }


// // CONTAINER HANDLING
// $containerClasses = $route['container'] ? 'container mx-auto px-2 pt-4 pb-12 md:pt-12 md:pb-24 md:px-0' : '';

// // TRANSLATION HANDLING
// $language = isset($_SESSION["user"]) ? $_SESSION["user"]["language"] : $_SESSION["guest"]["language"] ?? 'text_en';
// $translations = fetch('SELECT id, ' . $language . ' FROM translations');

// ?>

// <!DOCTYPE html>
// <html lang="en" class="bg-base-200" data-theme='<?php echo $theme; ?>'>

// <head>
//   <meta name="viewport" content="width=device-width, initial-scale=1.0">

//   <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
//   <script src="https://cdn.tailwindcss.com"></script>

//   <script src="https://kit.fontawesome.com/58a210823e.js" crossorigin="anonymous"></script>

//   <script src="/public/js/countdown.js"></script>
//   <script src="/public/js/share.js"></script>
//   <script src="/public/js/bid.js"></script>

//   <link rel="stylesheet" href="/public/css/theme.css">
//   <title>2dekans veilingen -
//     <?php echo $route['title']; ?>
//   </title>
// </head>

// <body>
//   <div class="min-h-screen">
//     <?php DEBUG ? include COMPONENTS . '/debug.php' : null; ?>
//     <?php $route['nav'] ? include COMPONENTS . '/nav.php' : null; ?>
    
//     <div class="relative <?php echo $containerClasses ?>">
//       <?php
//       echo strlen($alert) > 0
//         ? '
//       <div class="absolute px-4 flex justify-center w-full md:w-auto left-1/2 transform -translate-x-1/2 top-8 z-50">
//         ' . $alert . '
//       </div>
//       '
//         : null;
//       ?>
      

//       <?php include PUBLIC_S . '/' . $route['view']; ?>
//     </div>
//     <?php $route['footer'] ? include COMPONENTS . '/footer.php' : null; ?>
//   </div>
// </body>

// </html>
