<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

function byCategory () {
    global $connection;
    $query = "SELECT *FROM products WHERE categoryid IN ('5', '2', '4') ORDER BY categoryid ";
    $query2 = "SELECT name AS catname FROM product_categories WHERE id IN ('5', '2', '4') ORDER BY id ";
    $result = mysqli_query($connection, $query);
    $result2 = mysqli_query($connection, $query2);
    
    while($row2 = mysqli_fetch_array($result2)) {
        echo '<a href="?category='.$row2["catname"].'">'.$row2["catname"].'</a>' ;
       
    ?><section class="inline-block ml-60 mt-24 "><?php
    while($row = mysqli_fetch_array($result)) {
        echo '
        <a class="card card-compact w-60 inline-block ml-2 my-6 bg-white hover:bg-gray-100 relative">
            <form method="post" action="index.php?id=' .$row["id"]. '">
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
                    <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied">Bid</button>
                    <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                    <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
                </div>
            </form>
        </a>
        ' ;
    } 
    ?></section><?php
    }
}


// function getCategory () {
//     global $connection;
//     $query2 = "SELECT * FROM product_categories WHERE id = 4 ";
//     $result = mysqli_query($connection, $query2);
    
//     while($row = mysqli_fetch_array($result)) {
//     echo '<a href="?category='.$row["name"].'">'.$row["name"].'</a>' ;
//     }
// }
//     $query = "SELECT *FROM products WHERE categoryid IN ('5', '2') ORDER BY categoryid ";
//     $query2 = "SELECT name AS catname FROM product_categories WHERE id IN ('5', '2') ORDER BY id ";
//     $result = mysqli_query($connection, $query);
//     $result2 = mysqli_query($connection, $query2);
//     while($row2 = mysqli_fetch_array($result2)) {
//              echo '<a href="?category='.$row2["catname"].'">'.$row2["catname"].'</a>' ;
//              }