<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

function fetch($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $result = $stmt->get_result();
  $data = $result->fetch_all(MYSQLI_ASSOC);

  $stmt->close();

  return $result->num_rows > 1 || empty($data) ? $data : $data[0];
}

// TODO: replace by fetch
function fetchSingle($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $result = $stmt->get_result();
  $data = $result->fetch_all(MYSQLI_ASSOC);

  $stmt->close();

  return $data;
}

function insert($query, ...$params) {
  global $connection;

  $stmt = $connection->prepare($query);

  if (!empty($params)) {
    $paramTypes = '';
    $paramValues = [];

    foreach ($params as $param) {
      $paramTypes .= $param['type'];
      $paramValues[] = $param['value'];
    }

    $stmt->bind_param($paramTypes, ...$paramValues);
  }

  if (!$stmt->execute()) {
    $stmt->close();
    $connection->close();
    return false;
  }

  $stmt->close();
  return true;
}

function generateFingerprint($ip, $screen_resolution, $user_agent, $accept_language, $accept_encoding) {
  return hash('sha256', $ip . $screen_resolution . $user_agent . $accept_language . $accept_encoding);
}

function handleSessionFingerprint() {
  $fingerprint = generateFingerprint(
    $_SERVER['REMOTE_ADDR'],
    '1920x1080', // TODO: get screen resolution (JS)
    $_SERVER['HTTP_USER_AGENT'],
    $_SERVER['HTTP_ACCEPT_LANGUAGE'],
    $_SERVER['HTTP_ACCEPT_ENCODING']
  );

  if (!isset($_SESSION['fingerprint']) || $_SESSION['fingerprint'] !== $fingerprint) {
    $_SESSION['fingerprint'] = $fingerprint;
  }

  if ($_SESSION['fingerprint'] !== $fingerprint) {
    session_destroy();
  }
}

function handleAuthorization($userRole, $routeRoles) {
  if (!isset($_SESSION['user'])) {
    if (!empty($routeRoles)) {
      header('Location: /');
      exit();
    }
  }

  $access = in_array($userRole, $routeRoles) || empty($routeRoles);
  if (!$access) {
    header('Location: /');
    exit();
  }
  
  return true;
}

function handleAlert($get) {
  if (!(isset($get['success']) || isset($get['error']))) {
    return;
  }

  $type = isset($get['success']) ? 'success' : 'error';

  $message = $type === 'success'
    ? (SUCCESS_MAPPING[$get['success']] ?? 'We think it worked!')
    : (ERROR_MAPPING[$get['error']] ?? 'Something went wrong!');

  return '
    <div class="alert alert-' . $type . ' w-fit grid-flow-col md:pr-6">
      <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
      <span>' . $message . '</span>
    </div>
    <script>
      setTimeout(function() {
        var alerts = document.querySelectorAll(".alert");
        alerts.forEach(function(alert) {
          alert.style.display = "none";
        });
      }, 5000);
    </script>
  ';
}

function getUserTheme() {
  return isset($_SESSION['user']['theme'])
    ? THEME_MAPPING[$_SESSION['user']['theme']]
    : THEME_MAPPING['default'];
}

function getUserLanguage() {
  return isset($_SESSION['user']['language'])
    ? $_SESSION['user']['language']
    : (isset($_SESSION['guest']['language'])
      ? $_SESSION['guest']['language']
      : $_SESSION['guest']['language'] = 'text_en');
}


// The following code SHOULD check for expired auctions and then add the highest bid from that auction into the successful_bids table WHEN ITS DONE.
// $expired_auctions = fetch('SELECT * FROM products WHERE endDate < NOW()');
// foreach ($expired_auctions as $expired_auction) {
//   $successful_bid = fetch('SELECT * FROM bids WHERE productid = ? ORDER BY price DESC LIMIT 1',['type' => 'i','value' => $expired_auction["id"]]);
//   if (isset($successful_bid["id"])) {
//     // TODO: Add table for 'closed auctions'
//     $query = 'INSERT INTO successful_bids (originalBidid, bidderid, productid, bidPrice) VALUES (?, ?, ?, ?)';
//     insert(
//       $query,
//       ['type' => 'i', 'value' => $successful_bid["id"]],
//       ['type' => 'i', 'value' => $successful_bid["bidder"]],
//       ['type' => 'i', 'value' => $successful_bid["productid"]],
//       ['type' => 'd', 'value' => ''.$successful_bid["price"].''],
//     );

//     $query = "DELETE FROM bids WHERE productid = ?";
//     $deleteData = insert($query, ['type' => 'i', 'value' => $successful_bid["productid"]]);
//   }
// }
