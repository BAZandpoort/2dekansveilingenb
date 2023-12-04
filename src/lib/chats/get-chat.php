<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

session_start();

$outgoing_id = mysqli_real_escape_string($connection, $_POST['outgoing_id']);
$incoming_id = mysqli_real_escape_string($connection, $_POST['incoming_id']);
$output = "";

$sql = "SELECT * FROM messages LEFT JOIN user_profile ON user_profile.id = messages.outgoing_msg_id
        WHERE (outgoing_msg_id = {$outgoing_id} AND incoming_msg_id = {$incoming_id}) 
        OR (outgoing_msg_id = {$incoming_id} AND incoming_msg_id = {$outgoing_id})";
$query = mysqli_query($connection, $sql);
if (mysqli_num_rows($query) > 0) {
    while ($row = mysqli_fetch_assoc($query)) {
        if ($row['outgoing_msg_id'] === $outgoing_id) {
            $output .= '<div class="chat outgoing">
                            <div class="details">
                                <p>' . $row['msg'] . '</p>
                            </div>
                        </div>';
        } else {
            $output .= '<div class="chat incoming">
                            <img src="/public/images/' . $row['profilepicture'] . '">
                            <div class="details">
                                <p>' . $row['msg'] . '</p>
                            </div>
                        </div>';
        }
    }
    echo $output;
}




?>
