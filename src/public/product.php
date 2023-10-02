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

    $query2 = "SELECT * FROM users,user_profile
    WHERE users.id=user_profile.userid
    AND users.id = ?";
    $seller = fetch($query2,['type' => 'i', 'value' => $id]);

?>
<div class = "flex">
    <div class="flex-[1] rounded-3xl h-1/2">
        <img class="w-full h-full rounded-3xl" src="<?php echo $products["imageUrl"];?>"  />
        <div>
        <h2 class="card-title mt-8 mx-8"><?php echo $products["name"] ?></h2>
          <div class="mx-8">  <?php echo $products["description"] ?></div>
        </div>
        <div>
        <h2 class="card-title mt-8 mx-8"> about seller:</h2>
           <div>
                <div class="mt-4 mx-8"><?php echo $seller["firstname"]," ", $seller["lastname"] ?></div>
                <div class="mt-4 mx-8"><?php echo $seller["about"]?></div>
            </div>
        </div>
    </div>
    <div class="flex-[1] flex items-stretch">
        <div class="card w-full bg-base-96 shadow-xl">
            <div class="radial-progress mx-auto mt-8" style="--value:70;">
                time
            </div>
            <div class="card-body items-center text-center">
                <table class="table-auto"> 
                    <tr>
                            <td class="text-xl ">bidprice</td>
                            <td class = "text-xl" >buyprice</td>
                    </tr>
                    <tr>
                            <td>(current bid price)</td>
                            <td><?php echo $products["price"]?></td>
                    </tr>
                </table>
                <a href="Bidden.php" class="btn btn-primary">bit Now</a>
            </div>
        </div>
    </div>
</div>

