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
          <a class="card card-compact w-60 inline-block ml-2 my-6 bg-white hover:bg-gray-100 relative">
              <form method="post" action="/catalog/product?id=' .$row["id"]. '">
                  <img src="' .$row["imageUrl"]. '" class=" max-h-44 w-64 m-auto object-cover">
                  <div class="card-body">
                  <h2 class="card-title text-base">
                    ';
                    if(strlen($row["name"]) > 20) {
                    echo substr_replace($row["name"], "...", 21);} else { echo $row["name"];}
                    echo '</h2>
                    <div class="text-base mt-5"><p>€' .$row["price"]. '</p></div>
                      <input type="hidden"name="image"value="' .$row["imageUrl"]. '">
                      <input type="hidden"name="name"value="' .$row["name"]. '">
                      <input type="hidden"name="price"value="' .$row["price"]. '">
                      <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied" >Bid</button>
                      <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                      <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
                  </div>
              </form>
          </a>
          ' ;
        }
    } else {
        echo "Geen overeenkomende producten gevonden.";
    }
} else {
    
}
?>