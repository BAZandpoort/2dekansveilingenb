<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php'; 

function products() {
    $query = "SELECT * FROM products";
    $products = fetch($query);

    echo '<section class="inline-block ml-60 mt-24">';
    foreach ($products as $product) {
        $productName = (strlen($product["name"]) > 20)
            ? substr_replace($product["name"], "...", 21)
            : $product["name"];

            echo '
            <div class="card card-compact w-60 inline-block ml-2 my-6 bg-white relative">
                <div class="hover-card">
                <div class="dropdown dropdown-end">
                    <img src="' . $product["imageUrl"] . '" class="max-h-44 w-64 m-auto object-cover">
                        <label tabindex="0">
                            <div class="hover-dots cursor-pointer absolute -mt-56 right-2 text-7xl text-amber-400 opacity-0 block">...</div>
                        </label>
                          <ul tabindex="0" class="dropdown-content z-[1] p-2 shadow bg-base-100 rounded-box w-26 -mt-36 mr-2">
                            <a href="#"><svg href="#" class="w-6 h-6 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 19">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"/>
                            </svg></a>
                            <button onclick="fallbackCopyTextToClipboard(window.location.origin + \'/catalog/products/share' . '?id=' . $product["id"] . '\')"><svg class="w-5 h-5 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m5.953 7.467 6.094-2.612m.096 8.114L5.857 9.676m.305-1.192a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0ZM17 3.84a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Zm0 10.322a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Z"/>
                        </svg></button>

                          </ul>
                    </div>   
                </div> 
                    <div class="card-body">
                        <h2 class="card-title text-base">' . $productName . '</h2>
                        <div class="text-base mt-5"><p>€' . $product["price"] . '</p></div>
                        <input type="hidden" name="category" value="' . $product["categoryid"] . '">
                        <input type="hidden" name="image" value="' . $product["imageUrl"] . '">
                        <input type="hidden" name="name" value="' . $product["name"] . '">
                        <input type="hidden" name="price" value="' . $product["price"] . '">
                        <button type="submit" class="btn btn-warning mr-0 mx-32 -mt-11" name="bied">Bid</button>
                        <p class="text-base text-center"><span id="timer">00:00:00</span></p>
                        <p class="text-base text-center -mt-3">Status: <span id="status">Open</span></p>
                    </div>
                

               
            </div>
        ';
    }
    echo '</section>';
}
?>

<style>
.hover-card:hover .hover-dots {
    opacity: 1;
}
</style>

<script>
function copyToClipboard(text) {
var inputc = document.body.appendChild(document.createElement("input"));
inputc.value = window.location.href;
inputc.focus();
inputc.select();
document.execCommand('copy');
inputc.parentNode.removeChild(inputc);
}



function fallbackCopyTextToClipboard(text) {
  var textArea = document.createElement("textarea");
  textArea.value = text;
  
  // Avoid scrolling to bottom
  textArea.style.top = "0";
  textArea.style.left = "0";
  textArea.style.position = "fixed";

  document.body.appendChild(textArea);
  textArea.focus();
  textArea.select();

  try {
    var successful = document.execCommand('copy');
    var msg = successful ? 'successful' : 'unsuccessful';
    console.log('Fallback: Copying text command was ' + msg);
  } catch (err) {
    console.error('Fallback: Oops, unable to copy', err);
  }

  document.body.removeChild(textArea);
}
function copyTextToClipboard(text) {
  if (!navigator.clipboard) {
    fallbackCopyTextToClipboard(text);
    return;
  }
  navigator.clipboard.writeText(text).then(function() {
    console.log('Async: Copying to clipboard was successful!');
  }, function(err) {
    console.error('Async: Could not copy text: ', err);
  });
}
</script>