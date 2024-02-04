<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once DATABASE . '/connect.php';
require_once LIB . '/util/util.php';




    $user_messages = $_POST['messageValue'];

    $sql = "SELECT * FROM chatbot WHERE message LIKE ?";
    $data = fetch($sql, ['type' => 's', 'value' => $user_messages]);
     

    if($data) 
    {

        echo $data['response'];
    }else{

        echo "Sorry, I can't understand you.";
    }

?>