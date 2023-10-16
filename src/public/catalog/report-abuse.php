<?php
if (!isset($_GET['productid'])) {
    header('location: /');
    exit();
  }
  

if (!isset($_SESSION['user'])) {
  header('Location: /');
  exit();
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';

$productId = $_GET['productid'];
$query = 'SELECT * FROM products WHERE id = ?';
$productData = fetch($query, ['type' => 'i', 'value' => $productId]);
?>

<h1 class="text-center text-4xl font-bold mb-12">Report abuse</h1>
<h2 class="text-center text-2xl font-bold mb-12">Product: <u><?php echo $productData["name"]?></u></h2>

<form action="/src/lib/user/member/report-abuse.php" method="post" class="flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto">
  <input type="hidden" name="productid" id="productid" value="<?php echo $_GET["productid"]?>">

  <div class="flex flex-row justify-center gap-4 w-full">
    <div class="form-control flex-1 w-full">
      <label class="label">
        <span class="label-text">Type of abuse</span>
      </label>
      <select name="typeOfAbuse" class="select select-bordered w-full">
        <option value="Deception">Deceptive or misleading content</option>
        <option value="Trafficking">Trafficking of illegal products</option>
        <option value="Hate">Hateful or inflammatory conduct</option>
        <option value="Unreceived">Item not received</option>
        <option value="Other">Other (please specify)</option>
      </select>
    </div>
  </div>
  
  <!-- Description -->
  <div class="form-control w-full">
    <label class="label">
      <span class="label-text">Context</span>
    </label>
    <textarea name="context" class="textarea textarea-bordered min-h-[8em]" required></textarea>
  </div>

  <div class="form-control w-full max-w-xs mt-4">
    <button name="send" class="btn btn-primary">Send</button>
  </div>
</form>
