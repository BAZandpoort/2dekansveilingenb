<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}
?>

<div>
  <form action="/src/lib/member/addProduct.php" method="post" class="flex flex-col items-center gap-4">
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="userid">User ID</label>
      <input
      name="userid"
      id="userid"
      type="number"
      placeholder="52"
      class="input input-bordered w-full placeholder:opacity-30"
      required/>
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="categoryid">Category ID</label>
      <input
      name="categoryid"
      id="categoryid"
      type="categoryid"
      placeholder="21"
      class="input input-bordered w-full placeholder:opacity-30"
      required/>
    </div>
  
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="name">Product name</label>
      <input
      name="name"
      id="name"
      type="text"
      placeholder="Big Mac"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">Description</label>
      <input
      name="description"
      id="description"
      type="text"
      placeholder="Healthy food"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>
  
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="price">Price</label>
      <input
      name="price"
      id="price"
      type="number"
      placeholder="21.99"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="imageUrl">Image URL</label>
      <input
      name="imageUrl"
      id="imageUrl"
      type="url"
      placeholder="https://example.com/image.png"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <input type="submit" name="add" value="Add product" class="btn btn-wide place-self-center">
  </form>
  
  <div class="w-full text-center mt-8">
    <a class="link" href="/">Go back</a>
  </div>
</div>
