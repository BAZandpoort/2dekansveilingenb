<?php

    function secondsToTime($seconds) {
        $dtF = new \DateTime('@0');
        $dtT = new \DateTime("@$seconds");
        return $dtF->diff($dtT)->format('%a:%h:%i:%s');
    }

    if(!isset($_GET["id"])){
        header("location: /");
        exit();
    }

    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
    require_once LIB . '/util/util.php';
    
    $id=$_GET["id"];
    $query = "SELECT *, TIMESTAMPDIFF(SECOND, createdAT, auctionEndTime) AS timeleftatstart,TIMESTAMPDIFF(SECOND, now(), auctionEndTime) AS timeleft FROM products WHERE id = ?";
    $products = fetch($query, ['type' => 'i', 'value' => $id]);

    $query2 = "SELECT * FROM users,user_profile
    WHERE users.id=user_profile.userid
    AND users.id = ?";
    $seller = fetch($query2,['type' => 'i', 'value' => $id]);



    $query3 = 'SELECT *, COUNT(*) AS aantal FROM bids WHERE productid = '.$id.' AND userid = '.$_SESSION['user']['id'];
    $bid_info = fetch($query3);
    if ($bid_info["aantal"] > 0){
        $last_bid_amount = $bid_info["bidPrice"];
    } else {
        $last_bid_amount = 0;
    }
   

?>
<div class = "flex">
    <div class="flex-[1.1] rounded-3xl h-1/2">
        <img class="w-full h-full rounded-3xl" src="<?php echo $products["imageUrl"];?>"  /> 
    </div>
    <div class="flex-[0.9] flex items-stretch card w-full shadow-xl ">
        <div class="card w-full my-auto">
                <?php
                    if (isset($products["auctionEndTime"])){
                        $timeleft = secondsToTime($products["timeleft"]);
                                                
                        $progress_percent = ($products["timeleft"] / $products["timeleftatstart"]) * 100;
                        echo '
                            <div class="radial-progress mx-auto" style="--value:'.$progress_percent.';">
                                '.$timeleft.'
                            </div>
                        ';
                    }
                ?>
                <div class="card-body items-center text-center space-x-10 ">
                    <table class="table-auto flex space-x-10"> 
                        <tr>
                            <td class="text-xl">Your bid</td>
                            <td class="text-xl pl-4">Highest bid</td>
                        </tr>
                        <tr>
                            <td id="currentBid">€<?php echo $last_bid_amount?></td>
                            <td id="suggestedBid">€<?php echo $products["price"]?></td>
                        </tr>
                    </table>
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Enter amount</span>
                        </label>
                        <label class="input-group">
                            <form action="/src/lib/catalog/bid.php" method="post">
                                <input type="hidden" name="productid" id="productid" value=<?php echo $_GET["id"];?>>
                                <span>Price</span>
                                <input id="bidInput" name="bidInput" type="number" placeholder="0,00" class="input input-bordered" step="0.01" min="1.00" required/>
                                <button type="submit" class="btn btn-primary" name="bied">Bid</button>
                            </form>
                        </label>
                        </div>
                    </div>
        </div>
    </div>
</div>
<div class = "flex">
    <div>
    <h2 class="card-title mt-8 mx-8"><?php echo $products["name"] ?></h2>
    <div class="mx-8">  <?php echo $products["description"] ?></div>
    </div>
    <div>
        <h2 class="card-title mt-8 mx-8"> about seller:</h2>
    <div>
        <div class="mt-4 mx-8"><?php echo $seller["username"] ?></div>
        <div class="mt-4 mx-8"><?php echo $seller["about"]?></div>
    </div>
    </div>
</div>

// Bid function removed as it is now unnecessary.