<?php

    // if(!isset($_GET["id"])){
    //     header("location: /");
    //     exit();
    // }

    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once LIB . '/util/util.php';
    
    $id=$_GET["id"];
    $query = "SELECT * FROM products WHERE id = ?";
    $products = fetch($query, ['type' => 'i', 'value' => $id]);
    

?>
<div class = "flex">
    <div class="flex-[1.3] rounded-3xl h-1/2">
        <img class="w-full h-full rounded-3xl" src="<?php echo $products["imageUrl"];?>"  />
    </div>

    <div class="flex-[0.7]">

    </div>
</div>
<div>
    <?php echo $products["uitleg"] ?>
</div>