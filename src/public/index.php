<div>
  HELLO FROM INDEX

  <?php if (isset($_SESSION['user'])) {
    echo '<br>WELCOME, ' . $_SESSION['user']['username'];
  } ?>

</div>