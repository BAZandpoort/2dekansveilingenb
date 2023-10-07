<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}

include "routes.php";
$translation_routes = array_keys($routes);
?>

<div>
  <form action="/src/lib/member/add-translation.php" method="post" class="flex flex-col items-center gap-4">
    <div class="form-control w-full max-w-xs">
        <label class="label">
            <span class="label-text">Route</span>
        </label>
        <select name="route" id="route" class="select select-bordered">
            <option value="nav">nav</option>
            <option value="footer">footer</option>
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
