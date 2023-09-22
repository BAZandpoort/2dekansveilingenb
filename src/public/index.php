<div>
  <a href="language-select">🌐</a>

  <?php
    $txt_hello = array("HELLO FROM INDEX", "HALLO VANUIT INDEX", "BONJOUR DEPUIS INDICE");
    echo $txt_hello[$_SESSION["lang"]];
  ?>
  <?php if (isset($_SESSION['user'])) {
    

    
    $txt_welcome = array("WELCOME,", "WELKOM,", "BIENVENUE,");

    echo '<br> '.$txt_welcome[$_SESSION["lang"]].', ' . $_SESSION['user']['username'];
  } ?>

</div>