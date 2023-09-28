<?php


if (!isset($_SESSION['user'])) {
    header('Location: /');
    exit();
} else {
    require_once($_SERVER['DOCUMENT_ROOT'] . '/config.php');
    require_once DATABASE . '/connect.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $userId = $_SESSION['user']['id'];
        $newUsername = $_POST['username'];
        $newEmail = $_POST['email'];
        $newFirstname = $_POST['firstname'];
        $newLastname = $_POST['lastname'];

        $query = "SELECT * FROM users WHERE id = $userId";
        $result = mysqli_query($connection, $query);
        $user = mysqli_fetch_assoc($result);

        if ($user['username'] !== $newUsername || $user['email'] !== $newEmail || $user['firstname'] !== $newFirstname || $user['lastname'] !== $newLastname) {
            $query = "UPDATE users SET username = '$newUsername', email = '$newEmail', firstname = '$newFirstname', lastname = '$newLastname' WHERE id = $userId";

            if (mysqli_query($connection, $query)) {
                $_SESSION['update_success'] = 'Profile updated successfully! Log out and log in to see the changes.';
            } else {
                echo "Error updating profile: " . mysqli_error($connection);
            }
        } else {
            $_SESSION['no_changes'] = 'No changes were made to your profile.';
        }

        ob_start();
        header('Location: /edit');
        ob_end_flush();
        exit();
    }
}
?>
