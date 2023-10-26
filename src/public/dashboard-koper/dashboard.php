<?php
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

  
function name(){
  

 $userid = $_SESSION['user']['id'];

$data = fetch(
  'SELECT username FROM users WHERE id= ?',
  [
    'type' => 'i',
    'value' => $userid,
  ],
);
echo $data['username'];
}


function favorietenCount(){
  

$userid = $_SESSION['user']['id'];

$data = fetch(
  'SELECT COUNT(DISTINCT id) as aantal FROM favorieten WHERE userid = ?',
  [
    'type' => 'i',
    'value' => $userid,
  ],
);
echo $data['aantal'];
}







?>

<div class="border-2 border-current p-4 max-w-custom mx-auto justify-evenly flex flex-wrap m-2">

<div class="stats shadow">
  <div class="stat inline-block w-60 h-80 ">
    <h1 class="text-xl font-bold text-center b-8" style="margin: 10px 0;">Profile</h1>
    <div class="avatar left-11" style="margin: 10px 0;">
      <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
        <img src="https://avatars.githubusercontent.com/u/64209400?v=4" />
      </div>
    </div>
    <div class="text-center">
    <h1 class="text-center font-bold" style="margin: 10px 0;"><?php name(); ?></h1>
    <button class="btn btn-outline " style="margin: 10px 0;">My Settings</button>
</div>
  </div>
</div>




<!----------------------------------------------------------------------------------------------------------------- -->
<div class="inline-block align-top">
<div class="stats shadow">
  
<div class="stat w-60 h-60 ">
    <div class="stat-title text-center text-xl font-bold">Favorite Products</div>
    <div class="stat-value text-center"><?php favorietenCount();?></div>
    <div class="stat-desc">21% more than last month</div>
  </div>
  
  <div class="stat w-60 h-60">
    <div class="stat-title text-center font-bold text-xl">Ordered Products</div>
    <div class="stat-value text-center">0</div>
    <div class="stat-desc">21% more than last month</div>
  </div>
  
  <div class="stat w-60 h-60">
    <div class="stat-title text-center font-bold text-xl">Purchased Products</div>
    <div class="stat-value text-center">0</div>
    <div class="stat-desc">21% more than last month</div>
  </div>
  
</div> 
</div>
<!---------------- ------------------------------------------------------------------------------------------------- -->

<div class="inline-block align-right m-2">
<div class="stats shadow">
  <div class="stat ">
    <div class="flex items-center justify-center h-full">
      <div class="overflow-x-auto">
        <table class="table w-90">
          <!-- head -->
          <thead>
            <tr>
              <th class="text-sm">Purchase History</th>
              <th></th>
              <th><a class="link text-sm">See all</a></th>

            </tr>
          </thead>
          <tbody>
            <!-- row 1 -->
            <tr class="mb-4">
              <td>
                <div class="flex items-center space-x-3">
                  <div class="avatar">
                    <div class="mask mask-squircle w-12 h-12">
                      <img src="https://avatars.githubusercontent.com/u/64209400?v=4" alt="Avatar Tailwind CSS Component" />
                    </div>
                  </div>
                  <div>
                    <div class="font-bold">Hart Hagerty</div>
                  </div>
                </div>
              </td>
              <td>
                ddddd
              </td>
              <td>$85.20</td>
            </tr>
            <!-- row 2 -->
            <tr class="mb-4">
              <td>
                <div class="flex items-center space-x-3">
                  <div class="avatar">
                    <div class="mask mask-squircle w-12 h-12">
                      <img src="https://avatars.githubusercontent.com/u/64209400?v=4" alt="Avatar Tailwind CSS Component" />
                    </div>
                  </div>
                  <div>
                    <div class="font-bold">Hart Hagerty</div>
                  </div>
                </div>
              </td>
              <td>
                Zemlak, Daniel and Leannon
              </td>
              <td>$85.20</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>





<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->

<div class="inline-block align-right m-2 ">
<div class="stats shadow">
  <div class="stat ">
    <div class="flex items-center justify-center ">
      <div class="overflow-x-auto">
        <table class="table w-80 h-90">
          <!-- head -->
          <thead>
            <tr>
              <th class="text-sm">Favorite Products</th>
              <th></th>
              <th><a class="link text-sm">See all</a></th>

            </tr>
          </thead>
          <tbody>
            <?php
            
            $userid = $_SESSION['user']['id'];

$query = "SELECT * FROM products JOIN favorieten ON (products.id = favorieten.id) WHERE favorieten.userid = ?";
$favorites = fetchSingle($query, ['type' => 'i', 'value' => $userid]);


foreach ($favorites as $favorite) {
	echo '
  <tr class="mb-4">
  <td>
    <div class="flex items-center space-x-3">
      <div class="avatar">
        <div class="mask mask-squircle w-12 h-12">
          <img src="'.$favorite['imageUrl'].'" alt="Avatar Tailwind CSS Component" />
        </div>
      </div>
      <div>
        <div class="font-bold">'.$favorite['name'].'</div>
      </div>
    </div>
  </td>
  <td>
    '.$favorite['description'].'
  </td>
  <td>'.$favorite['price'].'</td>
</tr>';
}
            
            
            ?>
          
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>



<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->
<div class="inline-block align-right m-2 ">
<div class="stats shadow">
  <div class="stat ">
<div class="overflow-x-auto ">
  <table class="table w-80">
    <!-- head -->
    <thead>
      <tr>
        
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Delivery</th>
      </tr>
    </thead>
    <tbody>
      <!-- row 1 -->
      <tr>
       
        <td>
          <div class="flex items-center space-x-3">
            <div class="avatar">
              <div class="mask mask-squircle w-12 h-12">
                <img src="https://avatars.githubusercontent.com/u/64209400?v=4" alt="Avatar Tailwind CSS Component" />
              </div>
            </div>
            <div>
              <div class="font-bold">Hart Hagerty</div>
            </div>
          </div>
        </td>
        <td>
          Zemlak, Daniel and Leannon
          <br/>
          <span class="badge badge-ghost badge-sm">Electronics</span>
        </td>
        <td>$25.22</td>
        <th>
          <button class="btn btn-ghost btn-xs">Epress</button>
        </th>
      </tr>
      <!-- row 2 -->
      <tr>
       
        <td>
          <div class="flex items-center space-x-3">
            <div class="avatar">
              <div class="mask mask-squircle w-12 h-12">
                <img src="/tailwind-css-component-profile-3@56w.png" alt="Avatar Tailwind CSS Component" />
              </div>
            </div>
            <div>
              <div class="font-bold">Brice Swyre</div>
            </div>
          </div>
        </td>
        <td>
          Carroll Group
          <br/>
          <span class="badge badge-ghost badge-sm">Baby</span>
        </td>
        <td>$885.23</td>
        <th>
          <button class="btn btn-ghost btn-xs">Standard</button>
        </th>
      </tr>
      <!-- row 3 -->
      
    </tbody>
    
    
  </table>
</div>
</div>
</div>
</div>


<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->

</div>
