<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

$searchTerm = mysqli_real_escape_string($connection, $_POST['searchTerm']);
$output = "";

$sql = mysqli_query($connection, "SELECT * FROM users WHERE firstname LIKE '%{$searchTerm}%' OR lastname LIKE '%{$searchTerm}%'");
if (mysqli_num_rows($sql) > 0) {
    while ($row = mysqli_fetch_assoc($sql)) {
        $output .= '<a href="#">
                        <div class="content">
                            <img src="' . $row['profilePictureUrl'] . '">
                            <div class="details">
                            <span>' . $row['firstname'] . " " . $row['lastname'] .'</span>
                            <p>Test</p>
                        </div>
                        </div>
                        <div class="status-dot"><i class="fas fa-circle"></i></div>
                    </a>';
    }
} else {
    $output .= "No users found related to your search term";
}
echo $output;

?>