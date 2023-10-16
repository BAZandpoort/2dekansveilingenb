<?php


require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';








$sql2 = "SELECT * FROM products INNER JOIN favorieten ON (products.id = favorieten.id) WHERE favorieten.userid = ?";

$stmt = mysqli_prepare($connection, $sql2);

if ($stmt === false) {
    die("Prepare failed: " . mysqli_error($connection));
}


mysqli_stmt_bind_param($stmt, 'i', $userid);

if (mysqli_stmt_execute($stmt)) {

    $resultaat = mysqli_stmt_get_result($stmt);
    $uniqueItems = array();

    while ($row = mysqli_fetch_assoc($resultaat)) {
        $uniqueKey = $row["name"] . '-' . $row["price"];
        if (!isset($uniqueItems[$uniqueKey])) {
          
       echo' <div class="flex flex-col md:flex-row flex-wrap justify-between gap-8"> 
       <div id="product-' . $row['id'] . '" href="/" class="group card card-compact transition hover:opacity-90 md:flex-1 bg-base-100 shadow-xl">
       <figure>
         <img class="w-full" src="/public/images/' . $row["imageUrl"] . '" alt="Shoes" />
       </figure>

       
       <div class="card-body transition relative">

         

         <a href="/catalog/product?id=' . $row['id'] . '" class="card-title hover:underline">' . $row["name"] . '</a>
         <p>' . $row["description"] . '</p>
         <div class="card-actions justify-between items-center">
           <p class="text-xl text-left font-bold">€' . $row["price"] . '</p>
           <span id="countdown-wrapper" class="hidden countdown font-mono text-xl xl:flex">
             <span id="hours" style="--value:00;"></span>:
             <span id="minutes" style="--value:00;"></span>:
             <span id="seconds" style="--value:00;"></span>
           </span>
         </div>
       </div>
     </div>

 <script>
   productCardCountdown("' . $row['id'] . '", "' . $row['endDate'] . '");
 </script>
 </div>';
    $uniqueItems[$uniqueKey] = true;

    }
}

    mysqli_free_result($resultaat);
} else {
    die("Execute failed: " . mysqli_error($connection));
}

mysqli_stmt_close($stmt);


?>