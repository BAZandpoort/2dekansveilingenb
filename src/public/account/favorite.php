
<?php


require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';



    

    $userid = $_SESSION['user']['id'] ;
    $proid = $_GET["id"];
 
    
 
    $sql = insert("INSERT INTO favorieten (userid, id) VALUES ($userid, $proid)");
    


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
       echo' <a class="card card-compact w-60 inline-block ml-2 my-6 bg-white hover:bg-gray-100 relative">
        <form method="post" action="">
            <img src="' .$row["imageUrl"]. '" class=" max-h-44 w-64 m-auto object-cover">
            <div class="card-body">
            <h2 class="card-title text-base">' . $row["name"] .'</h2>
              <div class="text-base mt-5"><p>€' .$row["price"]. '</p></div>
                <input type="hidden"name="image"value="' .$row["imageUrl"]. '">
                <input type="hidden"name="name"value="' .$row["name"]. '">
                <input type="hidden"name="price"value="' .$row["price"]. '">
                <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied">Bid</button>
                <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                
                <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
            </div>
        </form>
    </a>';
    $uniqueItems[$uniqueKey] = true;

    }
}

    mysqli_free_result($resultaat);
} else {
    die("Execute failed: " . mysqli_error($connection));
}

mysqli_stmt_close($stmt);



   








 
 


?>