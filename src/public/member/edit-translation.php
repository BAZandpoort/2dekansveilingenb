<?php
if (!isset($_SESSION['user'])) {
    header('Location: /account/login');
    exit();
}

$error = $_GET['error'] ?? false;

if ($error) {
  echo '
    <div class="alert alert-warning w-full max-w-xs mx-auto mb-8">
      <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
      <span>
        ' . (ERROR_MAPPING[$error] ?? 'Unknown error') . '
      </span>
    </div>
  ';
}

$query = 'SELECT * FROM translations WHERE id = ' . $_GET["translation"];
$translation_text = fetch($query);
?>

<div>
  <form action="/src/lib/member/edit-translation.php" method="post" class="flex flex-col items-center gap-4">
    <p class="text-2xl">Edit translation ID: <?php echo $_GET["translation"]?></p>
    <input type="hidden" name="id" id="id" value=<?php echo $_GET["translation"]?>>
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">English</label>
      <input
      name="text_en"
      id="text_en"
      type="text"
      value=<?php echo $translation_text["text_en"];?>
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>
  
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">Nederlands</label>
      <input
      name="text_nl"
      id="text_nl"
      type="text"
      value=<?php echo $translation_text["text_nl"];?>
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">Français</label>
      <input
      name="text_fr"
      id="text_fr"
      type="text"
      value=<?php echo $translation_text["text_fr"];?>
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <input type="submit" name="edit" value="Edit translation" class="btn btn-wide place-self-center">
  </form>
  
  <div class="w-full text-center mt-8">
    <a class="link" href="/">Go back</a>
  </div>
</div>