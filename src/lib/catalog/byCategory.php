<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

function byCategory() {
	$query = "SELECT categoryid, product_categories.name, COUNT(*) AS count
            FROM products
            JOIN product_categories ON products.categoryid = product_categories.id GROUP BY products.categoryid
            ORDER BY count DESC
            LIMIT 3";
	$categories = fetch($query);

	foreach ($categories as $category) {
		$query = "SELECT * FROM products WHERE categoryid = ? ORDER BY categoryid LIMIT 5";
		$products = fetch($query, ['type' => 'i', 'value' => $category['categoryid']]);

		echo '
        <section class="mt-24 ml-48">
        <p class="text-2xl font-bold	">' . $category["name"] . '</p>
        ';
		foreach ($products as $product) {
			$productName = (strlen($product["name"]) > 20)
				? substr_replace($product["name"], "...", 21)
				: $product["name"];

			echo '
            <div class="card card-compact w-60 inline-block ml-2 my-6 bg-white hover:bg-gray-100 relative">
                <form method="post" action="/catalog/product?id=' . $product["id"] . '">
                    <img src="' . $product["imageUrl"] . '" class="max-h-44 w-64 m-auto object-cover">
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
            </div>';
		}
		echo '</section>';
	}
}
