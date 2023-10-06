<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}

$error = $_GET['error'] ?? false;
include "see-translations.php";

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
?>

<div>
  <form action="/src/lib/member/add-translation.php" method="post" class="flex flex-col items-center gap-4">
    <div class="form-control w-full max-w-xs">
        <label class="label">
            <span class="label-text">Route</span>
        </label>
        <select name="route" id="route" class="select select-bordered">
            <?php
                foreach ($translation_routes as $translation_route) {
                    echo '
                        <option value="'.$translation_route.'">'.$translation_route.'</option>
                    ';
                }
            ?>
        </select>
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">English</label>
      <input
      name="text_en"
      id="text_en"
      type="text"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>
  
    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">Dutch / Nederlands</label>
      <input
      name="text_nl"
      id="text_nl"
      type="text"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    <div class="flex flex-col gap-2 w-full max-w-xs">
      <label for="description">French / Français</label>
      <input
      name="text_fr"
      id="text_fr"
      type="text"
      class="input input-bordered w-full placeholder:opacity-30"
      required />
    </div>

    WARNING! ANY EMPTY FIELDS FOR TRANSLATION WILL SEND A DEFAULT "TRANSLATION UNAVAILABLE" TO THE DATABASE!

    <input type="submit" name="add" value="Add translation" class="btn btn-wide place-self-center">
  </form>
  
  <div class="w-full text-center mt-8">
    <a class="link" href="/">Go back</a>
  </div>
</div>
