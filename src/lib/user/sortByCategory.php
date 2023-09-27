<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

function byCategory() {
    global $connection;
    $query2 = "SELECT name AS catname, id FROM product_categories WHERE id IN ('5', '2', '7') GROUP BY id ";
    $result2 = mysqli_query($connection, $query2);

    while ($row2 = mysqli_fetch_array($result2)) {
        echo '<section class="mt-24 ml-48">';
        echo '<p>' . $row2["catname"] . '</p>';

        $query = "SELECT * FROM products WHERE categoryid = '" . $row2["id"] . "' ORDER BY categoryid LIMIT 5";
        $result = mysqli_query($connection, $query);
        $productCount = 0;

        while ($row = mysqli_fetch_array($result)) {
            echo '
            <a class="card card-compact w-60 inline-block ml-2 my-6 bg-white hover:bg-gray-100 relative">
                <form method="post" action="index.php?id=' . $row["id"] . '">
                    <img src="' . $row["imageUrl"] . '" class="max-h-44 w-64 m-auto object-cover">
                    <div class="card-body">
                        <h2 class="card-title text-base">';
            if (strlen($row["name"]) > 20) {
                echo substr_replace($row["name"], "...", 21);
            } else {
                echo $row["name"];
            }
            echo '</h2>
                        <div class="text-base mt-5"><p>€' . $row["price"] . '</p></div>
                        <input type="hidden" name="image" value="' . $row["imageUrl"] . '">
                        <input type="hidden" name="name" value="' . $row["name"] . '">
                        <input type="hidden" name="price" value="' . $row["price"] . '">
                        <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied">Bid</button>
                        <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                        <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
                    </div>
                </form>
            </a>';
            $productCount++;

            if ($productCount >= 5) {
                break;
            }
        }

        echo '</section>';
    }
}