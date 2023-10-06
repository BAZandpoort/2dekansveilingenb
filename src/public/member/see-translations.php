<?php
if (!isset($_SESSION['user'])) {
  header('Location: /account/login');
  exit();
}

include "routes.php";
$translation_routes = array_keys($routes);

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

if (!isset($_GET["location"])){
    $end_of_query = "";
} else {
    $end_of_query = 'WHERE location = "'.$_GET["location"].'"';
}
?>

<div>
    <a href="/dashboard/add-translation"><button class="btn btn-active">Add new translation</button></a>
    <div class="dropdown">
    <label tabindex="0" class="btn m-1">Sort by route</label>
        <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
            <li><a href="/dashboard/see-translations">See all</a></li>
            <?php

                echo '
                    <li><a href="/dashboard/see-translations?location=nav">nav</a></li>
                    <li><a href="/dashboard/see-translations?location=footer">footer</a></li>
                ';

                foreach ($translation_routes as $translation_route) {
                    echo '
                        <li><a href="/dashboard/see-translations?location='.$translation_route.'">'.$translation_route.'</a></li>
                    ';
                }
            ?>            
        </ul>
    </div>
    <div class="overflow-x-auto">
    <table class="table table-xs">
        <thead>
        <tr>
            <th>ID</th> 
            <th>English</th> 
            <th>Nederlands</th> 
            <th>Français</th>
            <th></th>
        </tr>
        </thead> 
        <tbody>

        <?php
            $query = 'SELECT * FROM translations ' . $end_of_query;
            if (isset($_GET["location"])){
                echo 'See translations of '.$_GET["location"];
            }
            $translations = fetch($query);

            foreach($translations as $row){
                $text_english = (strlen($row["text_en"]) > 40)
				? substr_replace($row["text_en"], "...", 41)
				: $row["text_en"];

                $text_nederlands = (strlen($row["text_nl"]) > 40)
				? substr_replace($row["text_nl"], "...", 41)
				: $row["text_nl"];

                $text_francais = (strlen($row["text_fr"]) > 40)
				? substr_replace($row["text_fr"], "...", 41)
				: $row["text_fr"];

                echo '
                    <tr>
                        <th>'.$row["id"].'</th> 
                        <td>'.$text_english.'</td> 
                        <td>'.$text_nederlands.'</td> 
                        <td>'.$text_francais.'</td>
                        <td><a href="/dashboard/edit-translation?translation='.$row["id"].'"><button class="btn btn-xs">✏</button></a></td>
                    </tr>
                ';
            }
        ?>
        
        
        </tbody> 
        <tfoot>
        <tr>
            <th></th> 
            <th>English</th> 
            <th>Nederlands</th> 
            <th>Français</th>
        </tr>
        </tfoot>
    </table>
    </div>
  <div class="w-full text-center mt-8">
    <a class="link" href="/">Go back</a>
  </div>
</div>
