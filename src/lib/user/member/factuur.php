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

// Create a new PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 16);


$userId = $_SESSION['user']['id'];

$purchaseHistory = fetchSingle(
    'SELECT * FROM orders WHERE buyerid = ? AND productid = ?',
    ["type" => "i", "value" => $userId],
    ["type" => "i", "value" => $productid]
);
$userDataResult = fetchSingle('SELECT * FROM users WHERE id = ?', ["type" => "i", "value" => $userId]);

// Check if the result is not empty
if (!empty($userDataResult)) {
    $userData = $userDataResult[0]; // Get the first row from the result

    // Print user's first name and last name
    if (isset($userData['firstname']) && isset($userData['lastname'])) {
        $pdf->Cell(40, 10, 'Beste ' . $userData['firstname'] . ' ' . $userData['lastname'] . ',');
        $pdf->Ln();
    } else {
        $pdf->Cell(40, 10, 'User name not available');
        $pdf->Ln();
    }
} else {
    $pdf->Cell(40, 10, 'User data not found');
    $pdf->Ln();
}
//now print U hebt op timeOfPurchase volgende producten aangekocht
$pdf->Cell(40, 10, 'U hebt op ' . date('d-m-Y') . ' volgende producten aangekocht:');
$pdf->Ln();
if ($purchaseHistory) {
    foreach ($purchaseHistory as $purchase) {
        $query = 'SELECT * FROM products WHERE id = ?';
        $productData = fetchSingle($query, ["type" => "i", "value" => $purchase['productid']]);

        $pdf->Cell(40, 10, 'Item Name: ' . $productData[0]['name']);
        $pdf->Ln();
        $pdf->Cell(40, 10, 'Price: ' . $productData[0]['price']);
        $pdf->Ln();
        $pdf->Ln();
    }
} else {
    $pdf->Cell(40, 10, 'No purchases found');
}

$pdf->Output('D', 'Invoice.pdf');
