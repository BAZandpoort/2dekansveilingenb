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

if ($purchaseHistory) {
    foreach ($purchaseHistory as $purchase) {
        $pdf->Cell(40, 10, 'Item Name: ' . $purchase['productName']);
        $pdf->Ln();
        $pdf->Cell(40, 10, 'Price: ' . $purchase['price']);
        $pdf->Ln();
        $pdf->Cell(40, 10, 'Date Purchased: ' . $purchase['timeOfPurchase']);
        $pdf->Ln(); 
        $pdf->Ln();  
        
    }
} else {
    $pdf->Cell(40, 10, 'No purchases found');
}

$pdf->Output('D', 'Invoice.pdf');
?>