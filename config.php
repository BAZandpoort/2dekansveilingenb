<?php
// Database credentials
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', '2dekans-veilingen');

// Import aliases
define('ROOT', $_SERVER['DOCUMENT_ROOT']);
define('ROUTES', ROOT . '/routes.php');
define('PUBLIC_R', ROOT . '/public');
define('SRC', ROOT . '/src');
define('COMPONENTS', SRC . '/components');
define('DATABASE', SRC . '/database');
define('LIB', SRC . '/lib');
define('PUBLIC_S', SRC . '/public');

// User structure
define('USER_STRUCTURE', [
  'id' => null,
  'username' => null,
  'email' => null,
  'theme' => null,
]);

// Error mapping
define('ERROR_MAPPING', [
  'missing' => 'Missing email or password',
  'empty' => 'Empty email or password',
  'invalid' => 'Invalid email or password',
  'password' => 'Passwords do not match',
  'email' => 'Email is already in use',
  'noChanges' => 'No changes were made',
  'accountUpdate' => 'Something went wrong while updating your account',
]);

// Success mapping
define('SUCCES_MAPPING', [
  'register' => 'You have been succesfully registered',
  'accountUpdate' => 'Your account has been updated',
]);

// Theme mapping
define('THEME_MAPPING', [
  'default' => 'customLight',
  'dark' => 'customDark',
  'light' => 'customLight',
]);

?>
