<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$userId = $_SESSION['user']['id'];
$query = "SELECT products.*, product_categories.name AS category FROM products JOIN product_categories ON products.categoryid = product_categories.id WHERE userid = ?";
$products = fetchSingle($query, ['type' => 'i', 'value' => $userId]);
?>

<form class="mb-12" method="post" action="/src/lib/user/seller/delete-product.php">
	<div class="overflow-x-auto">
		<table class="table">
			<thead>
				<tr>
					<th>
						<label>
							<input id="checkAll" type="checkbox" class="checkbox" />
						</label>
					</th>
					<th>Product</th>
					<th>Description</th>
					<th>Price</th>
					<th>Category</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php if (empty($products)) : ?>
					<tr>
						<td colspan="6" class="text-center">No products found</td>
					</tr>
				<?php else : ?>
					<?php foreach ($products as $product) : ?>
						<?php
						$description = $product['description'];
						if (strlen($product['description']) > 50) {
							$description = substr_replace($product['description'], '...', 51);
						}
						?>
						<tr>
							<th>
								<label>
									<input name="product-<?= $product["id"] ?>" id="checkbox" type="checkbox" class="checkbox" />
								</label>
							</th>
							<td>
								<div class="flex items-center space-x-3">
									<div class="avatar">
										<div class="mask rounded-lg w-12 h-12">
											<img src="/public/images/<?= $product["image"] ?>" />
										</div>
									</div>
									<div>
										<div class="font-bold"><?= $product["name"] ?></div>
										<div class="text-sm opacity-50">Ends at <?= $product["enddate"] ?></div>
									</div>
								</div>
							</td>
							<td>
								<div class="tooltip before:max-w-7xl" data-tip="<?= $product["description"] ?>">
									<?= $description ?>
								</div>
							</td>
							<td>€ <?= $product["price"] ?></td>
							<td><?= $product["category"] ?></td>
							<th>
								<a href="/seller/dashboard/edit?id=<?= $product["id"] ?>" class="btn btn-ghost btn-xs">Edit</a>
							</th>
						</tr>
					<?php endforeach; ?>
				<?php endif; ?>
			</tbody>
		</table>
	</div>

	<div class="w-full text-center mt-8">
		<?= (empty($products)) ? null : '<button name="delete" class="btn btn-error">Delete</button>' ?>
		<a class="btn btn-primary" href="/dashboard/products/add">Add Product</a>
	</div>
</form>

<h2 class="text-4xl mb-4 text-center">Your latest reviews</h2>

<div class="p-4 flex flex-wrap items-center justify-around">
	<div class="card w-96 bg-base-100">
		<div class="card-body">
			<h2 class="card-title justify-between">
				<div class="flex flex-row items-center gap-2">
					<div class="avatar">
						<div class="w-10 rounded-full">
							<img src="/public/images/test.jpg" />
						</div>
					</div>
					Millie the Cat
				</div>
				<div class="rating-sm">
					<input class="mask mask-star-2 bg-orange-400" />
					<input class="mask mask-star-2 bg-orange-400" />
					<input class="mask mask-star-2 bg-orange-400" />
					<input class="mask mask-star-2 bg-orange-400" />
					<input class="mask mask-star-2 bg-orange-200" />
				</div>
			</h2>
			<p>
				Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit beatae ipsa voluptatibus perferendis quos eaque nemo error tempora harum quas, laudantium tenetur, neque, facere exercitationem!
			</p>
		</div>
	</div>
</div>

<script>
	const checkAll = document.getElementById('checkAll');
	const checkboxes = document.querySelectorAll('input[id="checkbox"]');

	checkAll.addEventListener('change', function() {
		checkboxes.forEach((checkbox) => {
			checkbox.checked = checkAll.checked;
		});
	});
</script>