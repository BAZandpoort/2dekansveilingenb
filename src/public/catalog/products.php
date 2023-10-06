<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/catalog/products.php';
require_once COMPONENTS . '/product-card.php';

$products = getAllProducts();

echo '
<div class="flex flex-row gap-4">
  <div class="flex-[.3]">
  </div>
  <div class="divider divider-horizontal"></div> 
  <div class="flex flex-row flex-wrap gap-8 flex-[1.7]">
    <div class="flex flex-row flex-wrap justify-between gap-8">
';

foreach ($products as $index => $product) {
  if ($index > 0 && $index % 4 === 0) {
    echo '
      </div>
      <div class="flex flex-row flex-wrap justify-between gap-8">
    ';
  }

  productCard($product);
}

echo '
    </div>
  </div>
</div>
';
?>

<!-- 

// Dropdown for sharing and whatnot
<div class="dropdown dropdown-end absolute z-50">
                  <label tabindex="0">
                      <div class="hover-dots cursor-pointer absolute -mt-56 right-2 text-7xl text-amber-400 opacity-0 block">...</div>
                  </label>
                  <ul tabindex="0" class="dropdown-content z-[1] p-2 shadow bg-base-100 rounded-box w-26 -mt-36 mr-2">
                        <svg href="#" class="w-6 h-6 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 19">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"/>
                        </svg>
                    <button name="copy" onclick="fallbackCopyTextToClipboard(window.location.origin + \'/products/share' . '?id=' . $product["id"] . '\')"><svg class="w-5 h-5 hover:text-black text-gray-600 inline-block mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m5.953 7.467 6.094-2.612m.096 8.114L5.857 9.676m.305-1.192a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0ZM17 3.84a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Zm0 10.322a2.581 2.581 0 1 1-5.162 0 2.581 2.581 0 0 1 5.162 0Z"/></svg>
                    </button>
                  </ul>  
                </div>

// Script for copying to clipboard
<script>
function fallbackCopyTextToClipboard(text) {
  var textArea = document.createElement("textarea");
  textArea.value = text;
  
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

 -->
