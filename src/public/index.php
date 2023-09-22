<div>
  <a href="language-select">🌐</a>

  <?php
    $txt_hello = array("HELLO FROM INDEX", "HALLO VANUIT INDEX", "BONJOUR DEPUIS INDICE");
    echo $txt_hello[$lng];
  ?>
  <?php if (isset($_SESSION['user'])) {
    

    
    $txt_welcome = array("WELCOME,", "WELKOM,", "BIENVENUE,");

    echo '<br> '.$txt_welcome[$lng].', ' . $_SESSION['user']['username'];
  } ?>

</div>