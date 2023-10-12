<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
   
</head>
<body >
<style>
    .table-container {
        display: flex;
        justify-content: center;
        margin-top: 10px;
        background-color: rgb(64,64,64);
        border-radius: 20px;
    }

    th, td {
        border: 12px;
        padding: 20px;
        text-align: center;
    }

    .box {
        margin-top: 50px;
        border-radius: 20px;
        width: auto;
        height: auto;
        border: 4px solid dimgray; /* Border color is gray */
        background-color: dimgray; /* Background color is gray */
        padding: 10px;
        margin: 10px;
        display: inline-block;
    }
    .container {
    width: 100%;
    height: 100vh;
    color: white;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;

}

h2 {
    font-size: 2rem;
    margin-bottom: 1rem;
    text-align: center;
}

.description {
    text-align: center;
    width: 43%;
}

.clientImage {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.clientImage span {
    margin-left: 10px;
}

.clientImage img {
    width: 40px;
}

.reviewSection {
    padding: 1rem;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-around;
}

.reviewItem {
    width: 300px;
    padding: 10px;
    margin: 1rem;
    cursor: pointer;
    border-radius: 10px;

    border: 1px solid #10102a;
    transition: all .2s linear;
}

.reviewItem:hover {
    border-color: aqua;
    transform: scale(1.01);

    box-shadow: 0 0px 5px 0px #cbc0c0;
}

.top {
    margin-bottom: 1rem;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}

.top ul {
    display: flex;
    list-style: none;
}

.top ul li {
    padding-left: 4px;
}

article p {
    font-size: 15px;
    font-weight: 100;
    margin-bottom: 1rem;
    font-family: system-ui;
}


@media screen and (max-width:700px) {
    .container {
        height: auto;
    }

    .description {
        width: 90%;
    }
}

@media screen and (max-width:375px) {
    .reviewSection {
        padding: 0;
    }

    .reviewItem {
        width: 100%;
    }

    .clientImage {
        margin-bottom: 0.6rem;
    }

    .top {
        align-items: center;
        flex-direction: column;
        justify-content: center;
    }
}



</style>


<div style="margin-top: 340px;">
<div class="box">

<form method="post" action="/member/delete">
    <div class="table-container">
        <div class="overflow-x-auto">

            <table>
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

                    if (mysqli_num_rows($result) >0) {
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
                          
                            <a class='btn btn-outline text-center' href='/member/edit?id=" . $row['id'] . "'>Edit</a>
                   
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
        <div class="w-full text-center mt-8">
        <button type="submit" name="delete_selected" class="btn btn-outline text-center">Delete</button>  
     
    </form>
 
        <a class="btn btn-outline text-center" href="/dashboard/products/add">Add Product</a>
 
        </div>
        
        </div>
        </div>

        <div class="container">
        <h2>Your reviews</h2>
        <p class="description">See what your latest buyers said about your product or your attitude as a seller/auctioneer!</p>
    
        <!-- Clients Review Section -->
        <div class="reviewSection">

        <!-- Clients Review-1 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="top">
                    <div class="clientImage">
                        <img src="https://preview.redd.it/i-keep-seeing-this-angry-cat-meme-does-anyone-know-what-v0-n9p8aheg9jw91.jpg?width=1080&crop=smart&auto=webp&s=af0ff55ee92c8479c148d47e34d285633b98f76b" alt="">
                        <span>Ben Dover</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!</p>
                    <p>Jan 01, 2023</p>
                </article>
            </div>

        <!-- Clients Review-2 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="top">
                    <div class="clientImage">
                        <img src="https://thumbs.dreamstime.com/b/young-happy-positive-teenager-man-gesturing-ok-isolated-white-background-40784002.jpg" alt="">
                        <span>Craven Morehed</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!</p>
                    <p>Jan 01, 2023</p>
                </article>
            </div>

        <!-- Clients Review-3 Section Starts from Here  -->
            <div class="reviewItem">
                <div class="top">
                    <div class="clientImage">
                        <img src="https://images.unsplash.com/photo-1605980776566-0486c3ac7617?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxhY2slMjBndXl8ZW58MHx8MHx8fDA%3D&w=1000&q=80" alt="">
                        <span>Mike Oxlong</span>
                    </div>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                        <li><i class="fa-regular fa-star"></i></li>
                    </ul>
                </div>
                <article>
                    <p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
                        voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
                        facere exercitationem!</p>
                    <p>Jan 01, 2023</p>
                </article>

                
            </div>
            

    
        </div>
        <a href="/" class="link">Click to see more</a>
<br><br>
        <h2>Your current rating as seller/auctioneer</h2>
        <br>
            <div class="rating">
  <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
  <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
  <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" checked />
  <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
  <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400 " />
</div>
    </div>
    <br><br>
    <br><br>
    <br><br>
    <br><br><br><br>


   
    

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
