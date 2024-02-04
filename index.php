
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
<div id="floatingButtonContainer" class="btn btn-active btn-neutral fixed bottom-14 right-8  z-50">
    <button id="floatingButton" onclick="toggleChatbot()">Chatbot</button>
</div>




<div id="chatbotContainer" class="hidden fixed bottom-8 right-8 z-50">
    <div id="bot" style="margin: 30px 0; height: 700px; width: 450px; background: white; display: flex; flex-direction: column; align-items: center; justify-content: space-between; box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2); border-radius: 15px;">
        <div id="container" style="height: 90%; border-radius: 6px; width: 90%; background: #F3F4F6;">
            <div id="header" style="width: 100%; height: 10%; border-radius: 6px; background: grey; color: white; text-align: center; font-size: 2rem; padding-top: 12px; box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);">
                Chatbot 
            </div>

            <div id="body" style="width: 100%; height: 75%; background-color: #F3F4F6; overflow-y: auto; display: flex; flex-direction: column; align-items: center;">
                <div class="userSection chat chat-start" style="width: 100%; text-align: left;">
                    <div class="messages user-message chat-bubble" style="display: none;">
                    </div>
                </div>

                <div class="seperator" style="width: 100%; height: 20px;"></div>

                <div class="botSection chat chat-end" style="width: 100%; text-align: right;">
                    <div class="messages bot-reply chat-bubble" style="display: none;">
                    </div>
                </div>
            </div>

            <div id="inputArea" style="display: flex; align-items: center; justify-content: center; height: 10%; padding: 1rem; background: transparent;">
                <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" id="userInput" />
                <input type="submit" value="Submit" class="btn" onclick="sendMessage()" />
            </div>

        </div>
    </div>
</div>





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
  <script type="text/javascript">
   
   function toggleChatbot() {
    const floatingButton = document.getElementById('floatingButton');
    const chatbotContainer = document.getElementById('chatbotContainer');

    chatbotContainer.classList.toggle('hidden');

    chatbotContainer.style.top = `${floatingButton.offsetTop + floatingButton.offsetHeight}px`;

    if (!chatbotContainer.classList.contains('hidden')) {
        document.addEventListener('click', handleDocumentClick);
    }
}

function handleDocumentClick(event) {
    const chatbotContainer = document.getElementById('chatbotContainer');
    const floatingButton = document.getElementById('floatingButton');

    if (!chatbotContainer.contains(event.target) && event.target !== floatingButton) {
        chatbotContainer.classList.add('hidden');

        document.removeEventListener('click', handleDocumentClick);
    }
}

function sendMessage() {
    let userMessage = document.getElementById('userInput').value;

    let userHtml = '<div class="userSection chat chat-start" style="width: 100%; text-align: left;">' +
                    '<div class="messages user-message chat-bubble">' + userMessage + '</div>' +
                    '</div>';

    document.querySelector('#body').innerHTML += userHtml;

    document.querySelector('#body').classList.remove('chatSection');

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/src/lib/chatbot/chatbot.php");
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send(`messageValue=${userMessage}`);

    xhr.onload = function () {
        let botHtml = '<div class="botSection chat chat-end" style="width: 100%; text-align: right;">' +
                       '<div class="messages bot-reply chat-bubble">' + this.responseText + '</div>' +
                       '</div>';

        document.querySelector('#body').innerHTML += botHtml;
    };

    document.getElementById('userInput').value = "";
}

    


</script>
</body>

</html>
