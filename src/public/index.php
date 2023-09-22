<?php
  require "translations.php";
?>

<div>
  <a href="language-select">🌐</a>

  <?php
    echo $translate["hello from index"][$lng];
  ?>
  <?php if (isset($_SESSION['user'])) {
    echo '<br> '.$translate["welcome"][$lng].', ' . $_SESSION['user']['username'];
  } ?>

</div>