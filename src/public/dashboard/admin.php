<?php
    require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
   
    
    $query = "SELECT MAX(id) FROM users";
    $users_exists = fetch($query);
    $users=$users_exists["MAX(id)"];

    $new_users = fetch("SELECT * FROM `users` ORDER BY `createdAt` DESC Limit 6;");
    $new_products = fetch("SELECT products.*,product_categories.name AS categoryname FROM products JOIN product_categories ON products.id = product_categories.id ORDER BY `createdAt` DESC Limit 6;");

?>

<div class="drawer drawer-open ">
  <input id="my-drawer-4" type="checkbox" class="drawer-toggle" />
   <div class="drawer-content">
   <div class="navbar bg-base-100 shadow-sm rounded-lg ">
  <div class="navbar-start flex-1">
  </div>
  <div class="navbar-center hidden lg:flex ">
    <ul class="menu menu-horizontal px-1 gap-16 rounded-8 ">
      <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
        <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
      </div>
      <div class="text-right">
        <p class="text-2xl"><?php echo $users ?></p>
        <p>users</p>
      </div>
      <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
        <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
      </div>
      <div class="text-right">
        <p class="text-2xl">557</p>
        <p>Orders</p>
      </div>
      <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
        <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path></svg>
      </div>
      <div class="text-right">
        <p class="text-2xl">$11,257</p>
        <p>Sales</p>
      </div>
      <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
        <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
      </div>
      <div class="text-right">
        <p class="text-2xl">$75,257</p>
        <p>Balances</p>
      </div>    
    </ul>
  </div>
  <div class="flex-1 justify-end">
  </div>
</div>    
         <!-- New Users -->  
          <div class="mt-4">
          <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class=" overflow-x-auto">
              <table class="table">
                <thead>
                  <tr class="text-xs font-semibold tracking-wide text-left  uppercase border-b shadow bg-base-100">
                    <th class="px-4 py-3">new User</th>
                    <th class="px-4 py-3">E-mail</th>
                    <th class="px-4 py-3">Created At</th>
                    
                  </tr>
                </thead>
                <tbody class="border-b shadow bg-base-100">
                <?php foreach ($new_users as $user) { ?>
                  <tr class="hover">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                        <img class="rounded-full" src="https://avatars.githubusercontent.com/u/64209400?v=4" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><?php echo $user["username"] ?></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">#<?php echo $user["id"] ?></p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm"><?php echo $user["email"] ?></td>
                    <td class="px-4 py-3 text-sm"><?php echo $user["createdAt"]?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- ./New Users -->



        <!-- New products -->
        <div class="mt-4 ">
          <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class=" overflow-x-auto">
              <table class="table">
                <thead>
                  <tr class="text-xs font-semibold tracking-wide text-left  uppercase border-b shadow bg-base-100">
                    <th class="px-4 py-3 ">New products</th>
                    <th class="px-4 py-3">catagories</th>
                    <th class="px-4 py-3">description</th>
                    <th class="px-4 py-3">price</th>
                    <th class="px-4 py-3">Created At</th>
                    
                  </tr>
                </thead>
                <tbody class="border-b shadow bg-base-100">
                <?php foreach ($new_products as $product) { ?>
                  <tr class="hover">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <div class="relative hidden w-14 h-8 mr-3 md:block">
                            <img class="rounded-full h-12" width="80px" src="<?php echo '/public/images/' . $product['imageUrl']?>" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><?php echo $product["name"] ?></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">#<?php echo $product["id"] ?></p>
                        </div>
                      </div>
                    </td>
                    <td>
                    <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"><?php echo $product["categoryname"] ?></span>
                    </td>
                    <td class="px-4 py-3 text-sm"><?php echo $product["description"] ?></td>
                    <td class="px-4 py-3 text-sm"><?php echo $product["price"] ?></td>
                    <td class="px-4 py-3 text-sm"><?php echo $user["createdAt"]?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- ./New products-->
  </div> 
  <div class="drawer-side"> 
    <label for="my-drawer-4" aria-label="close sidebar"></label>
    <ul class="menu p-4 w-64 min-h-full bg-base-200 text-base-content mt-8">
      <!-- Sidebar content here -->
      <li> <a href="/" >
                <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path><path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path></svg>
               <span class="ml-3">Home</span>
            </a></li>
           
         <li>
            <a href="#" >
               <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                  <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h-2V8A5 5 0 1 0 0 8v6a1 1 0 0 0 1 1h8v4a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-4h6a1 1 0 0 0 1-1V8a5 5 0 0 0-2.582-4.377ZM6 12H4a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Z"/>
               </svg>
               <span class="flex-1 ml-3 whitespace-nowrap">Inbox</span>
            </a>
         </li>
         <li>
            <a href="#" >
            <svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#9ca5b4}</style><path d="M50.7 58.5L0 160H208V32H93.7C75.5 32 58.9 42.3 50.7 58.5zM240 160H448L397.3 58.5C389.1 42.3 372.5 32 354.3 32H240V160zm208 32H0V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192z"/></svg>
               <span class="flex-1 ml-3 whitespace-nowrap">remove products</span>
            </a>
         </li>
         <li>
            <a href="#" >
            <svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#b4bccb}</style><path d="M256 0a256 256 0 1 1 0 512A256 256 0 1 1 256 0zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/></svg>
               <span class="flex-1 ml-3 whitespace-nowrap">change timer</span>
            </a>
         </li>
         <li class = "mt-5">
           <div class="flex flex-row items-center mt-5 h-8">
              <div class="text-sm font-light tracking-wide text-gray-400 uppercase">Settings</div>
            </div>
         </li>
         <li>
          <a href="#" >
          <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#676c74}</style><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
               <span class="flex-1 ml-3 whitespace-nowrap">profile</span>
            </a>
          </li>
          <li>
          <a href="/account/settings/edit" >
          <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#7e838b}</style><path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/></svg>
               <span class="flex-1 ml-3 whitespace-nowrap"> Settings</span>
            </a>
          </li>
    </ul>
  </div>
</div>

