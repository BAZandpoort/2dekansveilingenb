<?php include_once LIB . '/catalog/byCategory.php'; ?>
<!-- <div class="container">
  <form action="/searchbar" method="post">   
      <label for="default-search" class="text-sm font-medium text-gray-900 sr-only dark:text-white ml-20 "></label>
      <div class="relative ml-16">
          <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
              <svg class="w-4 h-4 text-gray-500 light:text-white-400 " aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
              </svg>
          </div>
          <input type="text" name="zoeken" class="block w-full p-4 pl-10 text-sm  border border-gray-300 rounded-lg bg-gray-50 pr-40 dark:placeholder-gray-400 dark:text-black " placeholder="Search Products..." required>
          <button type="submit" name="submit" class=" text-white absolute right-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800  font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 ">Search</button>
      </div>
  </form>
</div>-->
<?php byCategory();
?>
