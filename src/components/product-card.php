<?php

function productCard($product, $shareable = false) {
  echo '
  <a id="product-' . $product['id'] . '" href="/" class="group card card-compact transition hover:opacity-90 flex-1 bg-base-100 shadow-xl relative">
    <figure>
      <img class="w-full" src="' . $product["imageUrl"] . '" alt="Shoes" />
    </figure>
    
    <div class="dropdown dropdown-end absolute top-0 right-0">
      <label tabindex="0">
        <i class="fa-solid fa-ellipsis-vertical"></i>
        <div class="transition cursor-pointer text-7xl text-amber-400 opacity-0 group-hover:opacity-100">...</div>
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

    <div class="card-body transition">
      <h2 class="card-title">' . $product["name"] . '</h2>
      <p>' . $product["description"] . '</p>
      <div class="card-actions justify-between items-center">
        <p class="text-xl text-left font-bold">€' . $product["price"] . '</p>
        <span id="countdown-wrapper" class="countdown font-mono text-xl">
          <span id="hours" style="--value:00;"></span>:
          <span id="minutes" style="--value:00;"></span>:
          <span id="seconds" style="--value:00;"></span>
        </span>
      </div>
    </div>
  </a>

  <script>
    countdown("' . $product['id'] . '");
  </script>
  ';
}
