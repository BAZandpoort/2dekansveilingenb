<?php
function handleRoute($uri, $routes) {
  $route = $routes[$uri] ?? false;

  if (!$route) {
    abort();
  }
  
  return $route;
}

function authorized($user, $route) {
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
}

function abort($code = 404) {
  http_response_code($code);
  header('Location: /404');
  exit();
}
