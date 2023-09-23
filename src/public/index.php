<!-- <div><?php
  
  if (isset($_SESSION['user'])) {
    echo '<br>WELCOME, ' . $_SESSION['user']['username'];
  } ?>

</div><br> -->


<?php
include_once LIB . '/user/productToIndex.php';

getProductGuest();
?>
