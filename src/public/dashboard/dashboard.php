<html>
<head>
  <link rel="stylesheet" href="./style.css">
</head>
<body>

<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once LIB . '/util/util.php';



?>
<div id="ex1">
<div id="ch">
    <p>Change Theme</p>
<button class="btn btn-active btn-neutral">Neutral</button>

</div>
</div>

  
</div>
<style>
#ex1 {
    border: none;
    padding: 10px;
    box-shadow: 5px 10px 8px #888888;
    width: 800px;
    height: 800px;
    border-radius: 25px;
    background-color: white;
  }
#ch{
    border: none;
    padding: 10px;
    box-shadow: 5px 10px 8px #888888;
    border-radius: 25px;
    width: 150px;
    height:150px;
}
.btn btn-active btn-neutral{
    align: center;
}
 
  
    </style>
</body>
</html>



