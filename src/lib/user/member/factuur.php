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

// Get the user ID from the session
$userId = $_SESSION['user']['id'];

// Fetch the purchase history of the user
$purchaseHistory = fetchSingle('SELECT * FROM user_purchases WHERE id = ?', ["type" => "i", "value" => $userId]);

// Fetch the user data based on the user ID
$userDataResult = fetchSingle('SELECT * FROM users WHERE id = ?', ["type" => "i", "value" => $userId]);

// Check if the user data result is not empty
if (!empty($userDataResult)) {
    $userData = $userDataResult[0]; // Get the first row from the result

    // Print user's first name and last name
    if (isset($userData['firstname']) && isset($userData['lastname'])) {
        $pdf->SetFont('Arial', '', 14   ); // Change font for user's name

        // Print the title
        $pdf->SetFont('Arial', 'B', 20); // Change font and size for the title
        $pdf->Cell(0, 10, 'Factuur 2dekansveiling B', 0, 1, 'C'); // Center-align the title
        $pdf->Ln();

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

// Print the message "U hebt volgende producten aangekocht"
$pdf->SetFont('Arial', '', 12); // Restore font for the main message
$pdf->Cell(40, 10, 'U hebt volgende producten aangekocht:');
$pdf->Ln();
$totalPrice = 0;

// Check if there is any purchase history
if ($purchaseHistory) {
    // Set font for table headers
    $pdf->SetFont('Arial', 'B', 12);

    // Create table headers
    $pdf->Cell(40, 10, 'Item Name', 1);
    $pdf->Cell(40, 10, 'Price', 1);
    $pdf->Cell(40, 10, 'Date Purchased', 1);
    $pdf->Ln();

    // Set font for table data
    $pdf->SetFont('Arial', '', 12);

    // Iterate through each purchase in the history
    foreach ($purchaseHistory as $purchase) {

        // Add the price of the purchase to the total price
        $totalPrice += $purchase['price'];

        // Create table rows
        $pdf->Cell(40, 10, $purchase['productName'], 1);
        $pdf->Cell(40, 10, chr(128) . $purchase['price'], 1);
        $pdf->Cell(40, 10, date('F j, Y', strtotime($purchase['timeOfPurchase'])), 1);
        $pdf->Ln();
    }
} else {
    $pdf->Cell(40, 10, 'No purchases found');
}

// Print the total price
$pdf->SetFont('Arial', 'B', 14); // Change font for the total price
$pdf->Cell(120, 10, 'Total Price:', 1, 0, 'R'); // Align the total price to the right
$pdf->Cell(20, 10, chr(128) . $totalPrice, 1); // Total price value
$pdf->Ln();
$pdf->Ln();

// Set font for footer
$pdf->SetFont('Arial', 'I', 12);
$pdf->Cell(0, 10, 'Betaal deze factuur binnen 14 dagen op rekeningnummer XXXX-XXXX-XXXX', 0, 1, 'C');

// Output the PDF
$pdf->Output('D', 'Invoice.pdf');
?>
