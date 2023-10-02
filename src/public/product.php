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
    <div class="flex-[1] rounded-3xl h-1/2">
        <img class="w-full h-full rounded-3xl" src="<?php echo $products["imageUrl"];?>"  />
        <div>
        <h2 class="card-title"><?php echo $products["name"] ?></h2>
            <?php echo $products["description"] ?>
        </div>
    </div>
    <div class="flex-[1] flex items-stretch">
        <div></div>
        <div class="radial-progress mx-[200px]" style="--value:70;">70%</div>
        <div></div>
    </div>
   
</div>

