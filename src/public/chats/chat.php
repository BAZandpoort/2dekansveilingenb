<?php 
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';

?>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

<body>
    <div class="box">
        <div class="wrapper">
            <section class="chat-area">
                <header>
                    <?php
                        $userssid = $_SESSION['user']['id'];
                        $userid = mysqli_real_escape_string($connection, $_GET['userid']);
                        $row = [];
                        $sql = mysqli_query($connection, "SELECT * FROM users JOIN user_profile ON users.id = user_profile.userid WHERE users.id = {$userid}");
                        if ($sql) {
                            if (mysqli_num_rows($sql) > 0) {
                                $row = mysqli_fetch_assoc($sql);
                            }
                        } else {
                            echo "Error: " . mysqli_error($connection);
                        }
                    ?>
                    <a href="/chats/users" class="back-icon"><i class="fas fa-arrow-left"></i></a>
                    <img src="/public/images/<?php echo $row['profilepicture'] ?>" alt="#">
                    <div class="details">
                        <span><?php echo $row['firstname'] . " " . $row['lastname'] ?></span>
                        <p>Online now</p>
                    </div>
                </header>
                <div class="chat-box">
                    
                </div>
                <form action="#" class="typing-area" autocomplete="off">
                    <input type="text" name="outgoing_id" value="<?php echo $userssid; ?>" hidden>
                    <input type="text" name="incoming_id" value="<?php echo $userid; ?>" hidden>
                    <input type="text" name="message" class="input-field" placeholder="Type a message here...">
                    <button><i class="fab fa-telegram-plane"></i></button>
                </form>
            </section>
        </div>
</div>

<script src="/public/js/chat.js"></script>

</body>






<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins');

*
{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
    font-family: 'Poppins', sans-serif;
}

.box
{
    padding-left: 35%;
}

.wrapper
{
    background: #fff;
    width: 450px;
    border-radius: 16px;
    box-shadow: 0 0 128px 0 rgba(0,0,0,0.1), 0 32px 64px -48px rgba(0,0,0,0.5);
}

.wrapper img
{
    object-fit: cover;
    border-radius: 50%;
}

.chat-area header
{
    display: flex;
    align-items: center;
    padding: 18px 30px;
}

.chat-area header .back-icon
{
    font-size: 18px;
    color: #333;

}

.chat-area header img
{
    height: 45px;
    width: 45px;
    margin: 0 15px;
}

.chat-area header span
{
    font-size: 17px;
    font-weight: 500;
}

.chat-box
{
    height: 500px;
    overflow-y: auto;
    background: #f7f7f7;
    padding: 10px 30px 20px 30px;
    box-shadow: inset 0 32px 32px -32px rgb(0 0 0 / 5%), inset 0 -32px 32px -32px rgb(0 0 0 / 5%) ; 
}

.chat-box::-webkit-scrollbar
{
    width: 0px;
}

.chat-box .chat
{
    margin: 15px 0;
}

.chat-box .chat p
{
    word-wrap: break-word;
    padding: 8px 16px;
    box-shadow:  0 0 32px rgb(0 0 0 / 8%), 0 16px 16px -16px rgb(0 0 0 / 10%) ; 
}

.chat-box .outgoing
{
    display: flex;
}

.outgoing .details
{
    margin-left: auto;
    max-width: calc(100% - 100px);
}

.outgoing .details p
{
    background: #333;
    color: #fff;
    border-radius: 18px 18px 0 18px;
}

.chat-box .incoming
{
    display: flex;
    align-items: flex-end;
}

.chat-box .incoming img
{
    height: 35px;
    width: 35px;
}

.incoming .details
{
    margin-left: 10px;
    margin-right: auto;
    max-width: calc(100% - 100px);
}

.incoming .details p
{
    background: #fff;
    color: #333;
    border-radius: 18px 18px 18px 0;
}

.chat-area .typing-area
{
    padding: 18px 30px;
    display: flex;
    justify-content: space-between;
}

.typing-area input
{
    height: 45px;
    width: calc(100% - 58px);
    font-size: 17px;
    border: 1px solid #ccc;
    padding: 0 13px;
    border-radius: 5px 0 0 5px;
    outline: none;
}

.typing-area button
{
    width: 55px;
    border: none;
    outline: none;
    background: #333;
    color: #fff;
    font-size: 19px;
    cursor: pointer;
    border-radius: 0 5px 5px 0;
}



</style>