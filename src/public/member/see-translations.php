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

if (!isset($_GET["location"])){
    $end_of_query = "";
} else {
    $end_of_query = 'WHERE location = "'.$_GET["location"].'"';
}
?>

<div>
    <div class="dropdown">
    <label tabindex="0" class="btn m-1">Select page to edit</label>
        <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
            <li><a href="/dashboard/see-translations">See all</a></li>
            <?php
                $query = 'SELECT location FROM translation WHERE location <> "none" GROUP BY location';
                $locations = fetch($query);

                foreach($locations as $row){
                    echo '
                        <li><a href="/dashboard/see-translations?location='.$row["location"].'">'.$row["location"].'</a></li>
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
            $query = 'SELECT * FROM translation ' . $end_of_query;
            if (isset($_GET["location"])){
                echo 'See translations of '.$_GET["location"];
            }
            $translations = fetch($query);

            foreach($translations as $row){
                $text_english = (strlen($row["english"]) > 20)
				? substr_replace($row["english"], "...", 21)
				: $row["english"];

                $text_nederlands = (strlen($row["nederlands"]) > 20)
				? substr_replace($row["nederlands"], "...", 21)
				: $row["nederlands"];

                $text_français = (strlen($row["français"]) > 20)
				? substr_replace($row["français"], "...", 21)
				: $row["français"];

                echo '
                    <tr>
                        <th>'.$row["id"].'</th> 
                        <td>'.$text_english.'</td> 
                        <td>'.$text_nederlands.'</td> 
                        <td>'.$text_français.'</td> 
                        <td>f</td>
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
