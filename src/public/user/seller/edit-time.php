<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';


// Initialize an empty array to store the products
$products = [];

// Check if the 'search' parameter is set in the GET request
if (isset($_GET['search'])) {
    // Get the search term from the GET request
    $searchTerm = $_GET['search'];

    // Prepare the SQL query to search for products based on the name or description
    $query = "SELECT * FROM products WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)";

    // Execute the query and fetch the products matching the search term
    $products = fetch($query, ['type' => 's', 'value' => "$searchTerm*"]);
} else {
    // If the 'search' parameter is not set, get all products
    $products = getAllProducts();
}

echo '
<div class="w-full flex flex-col md:flex-row gap-4 p-8 md:pr-40">
    <div class="hidden md:block md:flex-[.4] bg-base-300 rounded-2xl">
    </div>

    <div class="hidden md:flex divider divider-horizontal"></div> 

    <div class="flex flex-row flex-wrap gap-8 flex-[1.6]">
        <div class="w-full flex text-sm breadcrumbs">
            <ul>
                <li><a href="/">Home</a></li> 
                <li>Catalog</li>
                <li><a href="/catalog/products">All Products</a></li>
            </ul>
        </div>
        
        <div class="flex flex-wrap justify-between gap-8">
';


// Iterate over each product in the $products array
foreach ($products as $index => $product) {
    // Check if the index is greater than 0 and divisible by 4
    if ($index > 0 && $index % 4 === 0) {
        // If true, close the previous flex container and start a new one
        echo '
            </div>
            <div class="flex flex-col md:flex-row flex-wrap justify-between gap-8">
        ';
    }

    // Start a new flex container for each product
    echo '<div class="flex flex-col">';
    // Call the productCard function and pass the $product as an argument
    productCard($product, true);
    ?>

    <form action="/src/lib/user/seller/update-timer.php" method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
        <div class="flex flex-row justify-center gap-4 w-full">
            <!-- Auction End Date -->
            <div class="form-control flex-1 w-full">
                <label class="label">
                    <span class="label-text">Change Auction End Date</span>
                </label>
                <input type="datetime-local" name="endDate" placeholder="20.00" class="input input-bordered w-full" required />
                <input type="hidden" name="id" value="<?php echo $product['id']; ?>" /> 
            </div>
        </div>
        <div class="form-control w-full max-w-xs mt-4">
            <button name="change" class="btn btn-primary">change</button>
        </div>
    </form>

    <?php
    echo '</div>';
}

echo '

    </div>
</div>
';
?>

<script>
    productCountdown("<?php echo $product['endDate']; ?>")
</script>