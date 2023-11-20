<?php

session_start();

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

$userssid = $_SESSION['user']['id'];
$outgoing_id = $userssid;

$searchTerm = mysqli_real_escape_string($connection, $_POST['searchTerm']);
$output = "";

$sql = mysqli_query($connection, "SELECT *
FROM users
JOIN user_profile ON users.id = user_profile.userid
WHERE (users.id = $userssid OR users.id IN (
        SELECT DISTINCT outgoing_msg_id FROM messages WHERE incoming_msg_id = $userssid AND outgoing_msg_id IS NOT NULL
    )
    OR users.id IN (
        SELECT DISTINCT incoming_msg_id FROM messages WHERE outgoing_msg_id = $userssid AND incoming_msg_id IS NOT NULL
    )
) AND users.id != $outgoing_id AND (users.firstname LIKE '%{$searchTerm}%' OR users.lastname LIKE '%{$searchTerm}%') 
ORDER BY (SELECT MAX(msg_id) FROM messages WHERE (incoming_msg_id = users.id OR outgoing_msg_id = users.id) AND (outgoing_msg_id = $outgoing_id OR incoming_msg_id = $outgoing_id)) DESC
");
if (mysqli_num_rows($sql) > 0) {
    while ($row = mysqli_fetch_assoc($sql)) {
        $sql2 = "SELECT * FROM messages WHERE (incoming_msg_id = {$row['userid']} OR outgoing_msg_id = {$row['userid']}) 
                AND (outgoing_msg_id = {$outgoing_id} OR incoming_msg_id = {$outgoing_id}) ORDER BY msg_id DESC LIMIT 1";
        $query2 = mysqli_query($connection, $sql2);
        $row2 = mysqli_fetch_assoc($query2);
        if (mysqli_num_rows($query2) > 0) {
            $result = $row2['msg'];
        } else {
            $result = "No message available";
        }
        (strlen($result) > 28) ? $msg = substr($result, 0, 28).'...' : $msg = $result;

        $you = "";

        if ($row2 !== null && is_array($row2) && array_key_exists('outgoing_msg_id', $row2)) {
            $you = ($outgoing_id == $row2['outgoing_msg_id']) ? "You: " : "";
        }

        $output .= '<a href="/chats/chat?userid=' . $row['userid'] . '">
                        <div class="content">
                            <img src="' . $row['profilePictureUrl'] . '">
                            <div class="details">
                            <span>' . $row['firstname'] . " " . $row['lastname'] .'</span>
                            <p>'. $you . $msg .'</p>
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