<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';
require_once COMPONENTS . '/fpdf186/fpdf.php';
require_once DATABASE . '/connect.php';


// Start the session
session_start();

// Create a new PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 16);



$userId = $_SESSION['user']['id'];


$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);
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
        $pdf->Cell(40, 10, 'Item Name: ' . $purchase['productName']);
        $pdf->Ln();
        $pdf->Cell(40, 10, 'Price: ' . $purchase['price']);
        $pdf->Ln(); 
        $pdf->Ln();  
        
    }
} else {
    $pdf->Cell(40, 10, 'No purchases found');
}

$pdf->Output('D', 'Invoice.pdf');
?>