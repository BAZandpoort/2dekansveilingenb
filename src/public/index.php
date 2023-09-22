<div>
  <a href="language-select">🌐</a>

  <?php if (isset($_SESSION['user'])) {
    if (!isset($_SESSION["lang"])){
      $_SESSION["lang"] = 0;
    }

    $hello_from_index = array("HELLO FROM INDEX", "HALLO VANUIT INDEX", "BONJOUR DEPUIS INDICE");
    $welcome = array("WELCOME,", "WELKOM,", "BIENVENUE,");

    echo '<br> '.$welcome[$_SESSION["lang"]].', ' . $_SESSION['user']['username'];
  } ?>

</div>