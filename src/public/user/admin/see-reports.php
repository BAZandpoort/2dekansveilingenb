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

?>

QUERY FOR LATER:
SELECT abuse_reports.*, sender.username AS sender, products.name AS product, accused.username AS accused
FROM `abuse_reports`
INNER JOIN products ON (abuse_reports.productid = products.id)
INNER JOIN users AS sender ON (abuse_reports.senderid = sender.id)
INNER JOIN users AS accused ON (products.userid = accused.id);

<div>
    <div class="overflow-x-auto">
    <table class="table table-xs">
        <thead>
        <tr>
            <th>ID</th> 
            <th>Sender</th>
            <th>Seller</th> 
            <th>Product</th>
            <th>Created at</th>
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
                        <td>
                            <a href="/dashboard/translations/edit?translation='.$row["id"].'">
                                <button class="btn btn-xs">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
                                    </svg>
                                </button>
                            </a>
                        </td>
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
