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
        echo '<div class="flex flex-col gap-8">';
        while ($row = mysqli_fetch_assoc($resultaat)) {
            $uniqueKey = $row["name"] . '-' . $row["price"];
            if (!isset($uniqueItems[$uniqueKey])) {
                echo '
                <div class="card card-side bg-base-100 shadow-sm max-h-48">
                    <figure class="max-w-sm">
                        <img src="/public/images/' . $row['imageUrl'] . '" alt="Product"/>
                    </figure>
                    <div class="card-body">
                        <h2 class="card-title">' . $row['name'] . '</h2>
                        <p>' . $row['description'] . '</p>
                        <div class="card-actions justify-between items-center">
                            <p class="text-xl text-left font-bold">€' . $row["price"] . '</p>
                            <div class="flex flex-row gap-2">
                                <a href="/catalog/product?id=' . $row['id'] . '" class="btn btn-primary">View product page</a>
                                <form method="post" action="">
                                <input type="hidden" name="product_id" value="' . $row["id"] . '">
                                    <button class="btn btn-error btn-square" name="delete">
                                        <i class="fa-regular fa-trash-can fa-xl text-white"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>';
                $uniqueItems[$uniqueKey] = true;
            }
        }
        mysqli_free_result($resultaat);
        echo '</div>';
    
} else {
    die("Execute failed: " . mysqli_error($connection));
}
if(isset($_POST['delete'])){
 
    $userid = $_SESSION['user']['id'] ;
    $proid = $_POST['product_id'];
 
    $sql = "DELETE FROM favorieten WHERE userid = '$userid' AND id = ?";
    $delete = insert($sql, ['type' => 'i', 'value' => $proid]);
    
    
    }
?>
