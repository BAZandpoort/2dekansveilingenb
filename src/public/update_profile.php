
<?php
if (!isset($_SESSION['user'])) {

  header('Location: /');
  exit();
} else{
 require_once($_SERVER['DOCUMENT_ROOT'] . '/config.php');
 require_once DATABASE . '/connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    $userId =   $userId= $_SESSION['user']['id'];; 
    $newUsername = $_POST['username'];
    $newEmail = $_POST['email'];
    $newFirstname = $_POST['firstname'];
    $newLastname = $_POST['lastname'];


    $query = "UPDATE users SET username = '$newUsername', email = '$newEmail', firstname = '$newFirstname', lastname = '$newLastname' WHERE id = $userId";

    if (mysqli_query($connection, $query)) {
      echo '<div class="alert alert-success">
      <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
      <span>profile updated successfully!
      Log out and log in to see the changes.</span>
  </div>';
    } else {
        echo "Error updating profile: " . mysqli_error($connection);
    }
}
}
?>