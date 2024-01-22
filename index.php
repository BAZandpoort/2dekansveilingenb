<style>
.float{
	position:fixed;
	width:60px;
	height:60px;
	bottom:40px;
	right:40px;
	background-color:#0C9;
	color:#FFF;
	border-radius:50px;
	text-align:center;
	box-shadow: 2px 2px 3px #999;
}

.my-float{
	margin-top:22px;
}
</style>
<?php
date_default_timezone_set('Europe/Brussels');

require $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require DATABASE . '/connect.php';
require ROOT . '/router.php';
require LIB . '/util/util.php';
require LIB . '/util/translations.php';
require ROUTES;

session_start();
handleSessionFingerprint();

$user = $_SESSION['user'] ?? false;

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$route = handleRoute($uri, $routes);

handleAuthorization($route['auth']);

$theme = getUserTheme();
$alert = handleAlert($_GET);

$container = $route['container'] ? 'container mx-auto px-2 pt-4 pb-12 md:pt-12 md:pb-24 md:px-0' : '';
?>

<!DOCTYPE html>
<html lang="en" class="bg-base-200" data-theme='<?php echo $theme; ?>'>

<head>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.tailwindcss.com"></script>

  <script src="https://kit.fontawesome.com/58a210823e.js" crossorigin="anonymous"></script>

  <script src="/public/js/countdown.js"></script>
  <script src="/public/js/share.js"></script>
  <script src="/public/js/bid.js"></script>

  <link rel="stylesheet" href="/public/css/theme.css">
  <title>2dekans veilingen - <?= $route['title']; ?></title>
</head>

<body>
<a href="#" class="float">
<i class='bx bxs-comment-dots'></i>
</a>
  <div class="min-h-screen">
  
    <?php DEBUG ? include COMPONENTS . '/debug.php' : null; ?>
    <?php $route['nav'] ? include COMPONENTS . '/nav.php' : null; ?>
    
    <div class="relative <?php echo $container ?>">
      <?php
      echo strlen($alert) > 0
        ? '
        <div class="absolute px-4 flex justify-center w-full md:w-auto left-1/2 transform -translate-x-1/2 top-8 z-50">
        ' . $alert . '
        </div>'
        : null;
      ?>

      <?php include PUBLIC_S . '/' . $route['view']; ?>
    </div>
    <?php $route['footer'] ? include COMPONENTS . '/footer.php' : null; ?>
  </div>
</body>

</html>
