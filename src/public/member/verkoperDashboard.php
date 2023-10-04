<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
   
</head>
<body>
    
<style>
        .table-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            
           
        }
      

        th, td {
         margin-right: 40px;
        
        }

       
    </style>
    <form method="post" action="delete_products.php">
    <div class="table-container">
        <div class="overflow-x-auto">

            <table class="table" >
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" /> 
                        </th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
                    require_once DATABASE . '/connect.php';

                    $sellerId = $_SESSION['user']['id'];

                    $sql = "SELECT * FROM products WHERE userid = $sellerId";
                    $result = mysqli_query($connection, $sql);

                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td><input type='checkbox' name='selected_products[]' value='" . $row['id'] . "'></td>"; 
                            echo "<td>" . $row["id"] . "</td>";
                            echo "<td>" . $row["name"] . "</td>";
                            echo "<td>" . $row["description"] . "</td>";
                            echo "<td>" . $row["price"] . "</td>";

                            // Fetch the category name
                            $categoryId = $row["categoryid"];
                            $categoryQuery = "SELECT name FROM product_categories WHERE id = $categoryId";
                            $categoryResult = $connection->query($categoryQuery);
                            $categoryRow = $categoryResult->fetch_assoc();
                            $categoryName = $categoryRow["name"];

                            echo "<td>" . $categoryName . "</td>";
                            echo "<td>
                            <a class='btn btn-outline text-center' href='/'>Edit</a>
                   
                            </td>"; 
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>No products found.</td></tr>";
                    }

                    $connection->close();
                    ?>
                </tbody>
            </table>
        </div>
            </div>
        </div>
        <div class="w-full text-center mt-8">
        <div class="flex justify-center space-x-4">
        <button type="submit" name="delete_selected" class="btn btn-outline text-center">Delete</button>  
     
    </form>
 
        <a class="btn btn-outline text-center" href="/dashboard/products/add">Add Product</a>
 
    </div>

    <script>
      
        const checkAll = document.getElementById('checkAll');
        const checkboxes = document.querySelectorAll('input[name="selected_products[]"]');
        
        checkAll.addEventListener('change', function () {
            checkboxes.forEach((checkbox) => {
                checkbox.checked = checkAll.checked;
            });
        });
    </script>
</body>
</html>
