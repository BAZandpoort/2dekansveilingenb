<?php
// Database credentials
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', '2dekans-veilingen');

// Import aliases
define('ROOT', __DIR__);
define('ROUTES', __DIR__ . '/routes.php');
define('PUBLIC_R', __DIR__ . '/public');
define('SRC', __DIR__ . '/src');
define('COMPONENTS', SRC . '/components');
define('DATABASE', SRC . '/database');
define('LIB', SRC . '/lib');
define('PUBLIC_S', SRC . '/public');

define('ADMIN', 'admin');
define('MEMBER', 'member');
define('GUEST', 'guest');

define('ERROR_MAPPING', [
    'missing' => 'Missing email or password',
    'empty' => 'Empty email or password',
    'invalid' => 'Invalid email or password',
]);

?>
