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
                <div class="card card-compact w-60 inline-block ml-2 my-6 bg-white relative">
                    <form method="post" action="index.php?id=' . $product["id"] . '">
                    <div class="hover-card">
                    <div class="dropdown dropdown-end">
                        <img src="' . $product["imageUrl"] . '" class="max-h-44 w-64 m-auto object-cover">
                            <label tabindex="0">
                                <div class="hover-dots cursor-pointer absolute -mt-56 right-2 text-7xl text-amber-400 opacity-0 block">...</div>
                            </label>
                              <ul tabindex="0" class="dropdown-content z-[1] p-2 shadow bg-base-100 rounded-box w-26 -mt-36 mr-2">
                                <a href="#"><svg href="#" class="w-6 h-6 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 19">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"/>
                                </svg></a>
                                <a href="#"><svg class="w-5 h-5 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m5.953 7.467 6.094-2.612m.096 8.114L5.857 9.676m.305-1.192a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0ZM17 3.84a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Zm0 10.322a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Z"/>
                                </svg></a>
                              </ul>
                        </div>   
                    </div> 
                        <div class="card-body">
                            <h2 class="card-title text-base">' . $productName . '</h2>
                            <div class="text-base mt-5"><p>€' . $product["price"] . '</p></div>
                            <input type="hidden" name="image" value="' . $product["imageUrl"] . '">
                            <input type="hidden" name="name" value="' . $product["name"] . '">
                            <input type="hidden" name="price" value="' . $product["price"] . '">
                            <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied">Bid</button>
                            <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                            <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
                        </div>
                    </form>
                </div>
            ';
        }
    } else {
        echo "Geen overeenkomende producten gevonden.";
    }
} else {
    
}
?>
<style>
.hover-card:hover .hover-dots {
    opacity: 1;
}
</style>