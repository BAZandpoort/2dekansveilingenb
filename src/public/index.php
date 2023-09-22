<div>
  <a href="language-select">🌐</a>

  <?php
    $hello_msg = array("HELLO FROM INDEX", "HALLO VANUIT INDEX", "BONJOUR DEPUIS INDICE");
    echo $hello_msg[$_SESSION["lang"]];
  ?>
  <?php if (isset($_SESSION['user'])) {
    

    
    $welcome = array("WELCOME,", "WELKOM,", "BIENVENUE,");

    echo '<br> '.$welcome[$_SESSION["lang"]].', ' . $_SESSION['user']['username'];
  } ?>

</div>