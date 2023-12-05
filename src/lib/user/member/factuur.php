<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once COMPONENTS . '/fpdf186/fpdf.php';
require_once DATABASE . '/connect.php';


// Start the session
session_start();

if (!isset($_POST['send']) && !isset($_POST['history'])) {
    header('Location: /');
    exit();
}

$customerid = $_SESSION['user']['id'];
$productid = $_POST['productid'];
$deliveryMethod = $_POST['deliveryMethod'];

if (!isset($_POST['history'])) {
    $insertData = sendReport(
        $customerid,
        $productid,
        $deliveryMethod
    );
}

function sendReport(
    $customerid,
    $productid,
    $deliveryMethod
) {
    $query = 'INSERT INTO orders (productid, buyerid, deliverymethod)
            VALUES (?, ?, ?)';

    $insertData = insert(
        $query,
        ['type' => 'i', 'value' => $productid],
        ['type' => 'i', 'value' => $customerid],
        ['type' => 's', 'value' => $deliveryMethod]
    );

    return $insertData;
}

$userId = $_SESSION['user']['id'];

$purchaseHistory = fetchSingle(
    'SELECT * FROM orders WHERE buyerid = ?',
    ["type" => "i", "value" => $userId]
);
require('invoice.php');

$pdf = new PDF_Invoice( 'P', 'mm', 'A4' );
$pdf->AddPage();
$pdf->addSociete( "2dekansveilingen",
                  "BAZandpoort\n" .
                  "2800 Mechelen\n");
$pdf->addDate(date('d-m-Y'));
$pdf->addClient($userId);
$cols=array("PRODUCTID"    => 23,
            "NAME"  => 30,
            "DESCRIPTION"  => 78,
            "QUANTITY"     => 22,
            "TOTAL" => 30);
$pdf->addCols($cols);
$cols=array("PRODUCTID"    => "L",
            "DESCRIPTION"  => "L",
            "NAME"  => "L",
            "QUANTITY"     => "C",
            "TOTAL" => "R");
$pdf->addLineFormat($cols);
$pdf->addLineFormat($cols);

if ($purchaseHistory) {
    foreach($purchaseHistory as $purchase) {
        $query = 'SELECT * FROM products WHERE id = ?';
        $productData = fetchSingle($query, ["type" => "i", "value" => $purchase['productid']]);

        $y = 109;
        $line = array( "PRODUCTID"    => $productData[0]['id'],
                       "DESCRIPTION"  => $productData[0]['description'],
                       "NAME"  => $productData[0]['name'],
                       "QUANTITY"     => "1",
                       "TOTAL" => $productData[0]['price'] . ' EUR');
        $size = $pdf->addLine($y, $line);
        $y += $size + 2;
    }
}

$pdf->Output('D', 'Invoice.pdf');
?>

