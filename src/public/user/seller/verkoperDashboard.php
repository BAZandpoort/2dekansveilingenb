<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];
$query = "SELECT * FROM products WHERE userid = ?";
$products = fetchSingle($query, ['type' => 'i', 'value' => $userId]);

?>

<div class="rounded-2xl border-4 border-dimgray bg-dimgray p-10 m-10">
	<form method="post" action="/main-dash/delete">
		<div class="overflow-x-auto">
			<table class="table">
				<thead>
					<tr>
						<th>
							<label>
								<input type="checkbox" class="checkbox" />
							</label>
						</th>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Category</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php if (empty($products)): ?>
					<tr>
						<td colspan="6" class="text-center">No products found</td>
					</tr>
					<?php else: ?>
					<?php foreach ($products as $product): ?>
					<tr>
						<th>
							<label>
								<input type="checkbox" class="checkbox" />
							</label>
						</th>
						<td>
							<div class="flex items-center space-x-3">
								<div class="avatar">
									<div class="mask mask-squircle w-12 h-12">
										<img src="/public/images/<?= $product["imageUrl"] ?>" />
									</div>
								</div>
								<div>
									<div class="font-bold">Hart Hagerty</div>
									<div class="text-sm opacity-50">United States</div>
								</div>
							</div>
						</td>
						<td>
							Zemlak, Daniel and Leannon
							<br/>
							<span class="badge badge-ghost badge-sm">Desktop Support Technician</span>
						</td>
						<td>Purple</td>
						<th>
							<button class="btn btn-ghost btn-xs">details</button>
						</th>
					</tr>
					<?php endforeach; ?>
					<?php endif; ?>
				</tbody>
				
			</table>
		</div>

		<div class="w-full text-center mt-8">
			<button name="delete_selected" class="btn btn-error">Delete</button>
			<a class="btn btn-primary" href="/dashboard/products/add">Add Product</a>
		</div>
	</form>
</div>

<div class="container">
	<h2 class="text-4xl mb-4 text-center">Your reviews</h2>
	<p class="text-center">See what your latest buyers said about your product or your attitude as a seller/auctioneer!</p>

	<div class="p-4 flex flex-wrap items-center justify-around">

		<div class="w-[300px] p-2 m-4 border border-solid border-black">
			<div class="mb-2 flex flex-row items-center justify-between">
				<div class="flex flex-row items-center">
					<img class="w-10" src="https://preview.redd.it/i-keep-seeing-this-angry-cat-meme-does-anyone-know-what-v0-n9p8aheg9jw91.jpg?width=1080&crop=smart&auto=webp&s=af0ff55ee92c8479c148d47e34d285633b98f76b" alt="">
					<span class="ml-2">Ben Dover</span>
				</div>
				<ul class="flex">
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
				</ul>
			</div>
			<article>
				<p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
					voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
					facere exercitationem!</p>
				<p class="text-sm font-thin mb-4">Jan 01, 2023</p>
			</article>
		</div>

		<div class="w-[300px] p-2 m-4 border border-solid border-black">
			<div class="mb-2 flex flex-row items-center justify-between">
				<div class="flex flex-row items-center">
					<img class="w-10" src="https://thumbs.dreamstime.com/b/young-happy-positive-teenager-man-gesturing-ok-isolated-white-background-40784002.jpg" alt="">
					<span class="ml-2">Craven Morehed</span>
				</div>
				<ul class="flex">
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
				</ul>
			</div>
			<article>
				<p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
					voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
					facere exercitationem!</p>
				<p class="text-sm font-thin mb-4">Jan 01, 2023</p>
			</article>
		</div>

		<div class="w-[300px] p-2 m-4 border border-solid border-black">
			<div class="mb-2 flex flex-row items-center justify-between">
				<div class="flex flex-row items-center">
					<img class="w-10" src="https://images.unsplash.com/photo-1605980776566-0486c3ac7617?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxhY2slMjBndXl8ZW58MHx8MHx8fDA%3D&w=1000&q=80" alt="">
					<span class="ml-2">Mike Oxlong</span>
				</div>
				<ul class="flex">
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-solid fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
					<li class="pl-2"><i class="fa-regular fa-star"></i></li>
				</ul>
			</div>
			<article>
				<p class="review">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa
					voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque,
					facere exercitationem!</p>
				<p class="text-sm font-thin mb-4">Jan 01, 2023</p>
			</article>
		</div>
	</div>
	<a href="/" class="link">Click to see more</a>

	<h2 class="text-4xl mb-4 text-center">Your current rating as seller/auctioneer</h2>
	<div class="rating">
		<input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
		<input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
		<input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
		<input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
		<input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
	</div>
</div>

<script>
	const checkAll = document.getElementById('checkAll');
	const checkboxes = document.querySelectorAll('input[name="selected_products[]"]');

	checkAll.addEventListener('change', function() {
		checkboxes.forEach((checkbox) => {
			checkbox.checked = checkAll.checked;
		});
	});
</script>
