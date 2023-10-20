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

<div>
    <div class="overflow-x-auto">
    <table class="table table-xs">
        <thead>
        <tr>
            <th>Created at</th>
            <th>Sender</th>
            <th>Accused</th>
            <th>Product</th>
            <th>Abuse info</th>
        </tr>
        </thead>
        <tbody>

        <?php
            $query = 'SELECT abuse_reports.*, sender.username AS senderUsername, products.name AS productName, accused.id AS accusedid, accused.username AS accusedUsername
                FROM `abuse_reports`
                INNER JOIN products ON (abuse_reports.productid = products.id)
                INNER JOIN users AS sender ON (abuse_reports.senderid = sender.id)
                INNER JOIN users AS accused ON (products.userid = accused.id)
                ORDER BY createdAt DESC
            ';
            $reports = fetch($query);

            foreach($reports as $report){

                echo '
                    <tr>
                        <td>'.$report["createdAt"].'</td> 
                        <td>
                            <div class="tooltip" data-tip="User ID: '.$report["senderid"].'">
                                '.$report["senderUsername"].'
                            </div>
                        </td> 
                        <td>
                            <div class="tooltip" data-tip="User ID: '.$report["accusedid"].'">
                                '.$report["accusedUsername"].'
                            </div>
                        </td>
                        <td>
                            <div class="tooltip" data-tip="Product ID: '.$report["productid"].'">
                                <u><a href="../catalog/product?id='.$report["productid"].'">'.$report["productName"].'</a></u>
                            </div>
                        </td> 
                        <td>
                            <div class="collapse bg-base-50">
                                <input type="checkbox" class="peer" /> 
                                <div class="collapse-title bg-primary text-primary-content peer-checked:bg-secondary peer-checked:text-secondary-content">
                                    <b>'.$report["typeOfAbuse"].'</b>
                                </div>
                                <div class="collapse-content bg-primary text-primary-content peer-checked:bg-secondary peer-checked:text-secondary-content"> 
                                    <p>Context: <i>'.$report["context"].'</i></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                ';
            }
        ?>
        
        
        </tbody> 
        <tfoot>
        <tr>
            <th>Created at</th>
            <th>Sender</th>
            <th>Accused</th>
            <th>Product</th>
            <th>Abuse info</th>
        </tr>
        </tfoot>
    </table>
    </div>
  <div class="w-full text-center mt-8">
    <a class="link" href="/">Go back</a>
  </div>
</div>
