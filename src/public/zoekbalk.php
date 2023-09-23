<?php
 
if (!isset($_POST['submit'])) {
    header('location: /');
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$error = $_GET['error'] ?? false;

if ($error) {
  echo '
    <div class="alert alert-warning w-full max-w-xs mx-auto mb-8">
      <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
      <span>' .
    (ERROR_MAPPING[$error] ?? 'Unknown error') .
    '</span>
    </div>
  ';
}


if (isset($_POST['submit'])) {
    $zoeken = $_POST['zoeken'];

    $sql = "SELECT * FROM products WHERE name LIKE '%$zoeken%'";
    $result = mysqli_query($connection, $sql);
    if ($result->num_rows > 0) {
        while ($row = mysqli_fetch_array($result)) {
            echo '
                <div class="card card-compact w-96 inline-flex mx-14 my-16 bg-white ">
                    <form method="post" action="index.php?id=' .$row["id"]. '">
                        <img src="' .$row["imageUrl"]. '" class="rounded-xl max-h-52 w-full ">
                        <div class="card-body items-center text-center pb-16">
                          <h2 class="card-title mt-10">' .$row["name"]. '</h2>
                          <p>' .$row["description"]. '</p>
                          <div class="text-2xl "><p>€' .$row["price"]. '</p></div>
                            <input type="hidden"name="image"value="' .$row["imageUrl"]. '">
                            <input type="hidden"name="name"value="' .$row["name"]. '">
                            <input type="hidden"name="price"value="' .$row["price"]. '">
                            <button type="submit" class="btn btn-warning my-3 mb-10" name="buy">Buy now<i class="fa fa-shopping-cart"></i></button>
                        </div>
                    </form>
                </div>
            ' ;
        }
    } else {
        echo "Geen overeenkomende producten gevonden.";
    }
} else {
    
}
?>