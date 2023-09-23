<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

function getProductGuest () {
    global $connection;
    $query = "SELECT * FROM products";
    $result = mysqli_query($connection, $query);

    while($row = mysqli_fetch_array($result)) {
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
}