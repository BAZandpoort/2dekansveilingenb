<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 
	<title></title>
	
	<style>
 .main-div {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 500px;
  width: 900px;
  margin: 0 auto;
  border-radius: 25px;
  background-color: #f0f0f0;
}
.main-div h1{
  font-size: 20px;
  font-weight: bold;
}

.row {
  display: flex;
   margin-bottom: 40px;
}

.row1 .rectangle-div{
  width: 200px;
  height: 100px;
  margin-top: 40px;
  margin-right: 10px;
  margin: 20px;
  border-radius: 25px;
  background-color: black;
  transition: transform 0.2s, box-shadow 0.2s;
}
.rectangle-div:hover{
  width: 300px;
  height: 150px;
  transform: scale(1.1);
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);

}
.rectangle-div p{
  font-size: 18px;
  display: flex;
  align-content: center;
  justify-content: center;

}
.hover-text{
   position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.2s, visibility 0.2s;
}
.rectangle-div:hover .hover-text{
  opacity: 1;
  visibility: visible;
   position: absolute;
  top: 50%; /* Center text vertically */
  left: 50%; /* Center text horizontally */
  transform: translate(-50%, -50%);
}

.row2 .square-div {
  width: 100px;
  height: 100px;
  margin-right: 10px;
  border-radius: 25px;
  margin: 20px;
  background-color: black;
justify-content: center;
align-content: center;
display: flex;

}
svg {
  display: block;
  margin: 0 auto;
  margin-top: 10px;
}
.square-div:hover{
  width: 110px;
  height: 110px;
  transform: scale(1.1);
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);

}



    </style>

</head>
<body>
	
	  
</head>
<body>
   <div class="main-div">
    <h1>Dashboard</h1>
    <div class="row row1">
      <a href="/catalog/products">
      <div class="rectangle-div">
        <p>Producten</p>
        <?php
require_once LIB . '/util/util.php';
require_once DATABASE . '/connect.php';
$sql = "SELECT COUNT(name) as aantal FROM products";
$aantalp = fetch($sql);

   ?>
        <a class="hover-text">Het aantal producten zijn <?php echo $aantalp['aantal']; ?></a>
      </div>
      </a>
      <div class="rectangle-div"><p>Wisnt</p></div>
      <div class="rectangle-div">
        <p>Producten Toevoegen</p>
        <a class="hover-text">Wil je een product toevoegen?</a>
      </div>
    </div>
    <div class="row row2">
      
      <div class="square-div">
        <label class="swap swap-rotate">
  
  <input type="checkbox" />
  
  
  <svg class="swap-on fill-current w-20 h-20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5.64,17l-.71.71a1,1,0,0,0,0,1.41,1,1,0,0,0,1.41,0l.71-.71A1,1,0,0,0,5.64,17ZM5,12a1,1,0,0,0-1-1H3a1,1,0,0,0,0,2H4A1,1,0,0,0,5,12Zm7-7a1,1,0,0,0,1-1V3a1,1,0,0,0-2,0V4A1,1,0,0,0,12,5ZM5.64,7.05a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29,1,1,0,0,0,0-1.41l-.71-.71A1,1,0,0,0,4.93,6.34Zm12,.29a1,1,0,0,0,.7-.29l.71-.71a1,1,0,1,0-1.41-1.41L17,5.64a1,1,0,0,0,0,1.41A1,1,0,0,0,17.66,7.34ZM21,11H20a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Zm-9,8a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V20A1,1,0,0,0,12,19ZM18.36,17A1,1,0,0,0,17,18.36l.71.71a1,1,0,0,0,1.41,0,1,1,0,0,0,0-1.41ZM12,6.5A5.5,5.5,0,1,0,17.5,12,5.51,5.51,0,0,0,12,6.5Zm0,9A3.5,3.5,0,1,1,15.5,12,3.5,3.5,0,0,1,12,15.5Z" fill="grey"/>
</svg>
  
  
  <svg class="swap-off fill-current w-20 h-20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.64,13a1,1,0,0,0-1.05-.14,8.05,8.05,0,0,1-3.37.73A8.15,8.15,0,0,1,9.08,5.49a8.59,8.59,0,0,1,.25-2A1,1,0,0,0,8,2.36,10.14,10.14,0,1,0,22,14.05,1,1,0,0,0,21.64,13Zm-9.5,6.69A8.14,8.14,0,0,1,7.08,5.22v.27A10.15,10.15,0,0,0,17.22,15.63a9.79,9.79,0,0,0,2.1-.22A8.11,8.11,0,0,1,12.14,19.73Z" fill="grey"/></svg>
  
</label>
      </div>
      <div class="square-div">
<a href="/account/favorite">
    <svg xmlns="http://www.w3.org/2000/svg" height="70px" viewBox="0 0 512 512"><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" fill="grey"/></svg>
    </a>
      </div>
      <div class="square-div">
        <a href="">
        <svg xmlns="http://www.w3.org/2000/svg" height="70px" viewBox="0 0 512 512"><path d="M399 384.2C376.9 345.8 335.4 320 288 320H224c-47.4 0-88.9 25.8-111 64.2c35.2 39.2 86.2 63.8 143 63.8s107.8-24.7 143-63.8zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm256 16a72 72 0 1 0 0-144 72 72 0 1 0 0 144z " fill="grey"/></svg>
        </a>
      </div>
      <div class="square-div">
        <a href="/account/logout">
        <svg xmlns="http://www.w3.org/2000/svg" height="70px" viewBox="0 0 512 512"><path d="M217.9 105.9L340.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L217.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1L32 320c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM352 416l64 0c17.7 0 32-14.3 32-32l0-256c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32l64 0c53 0 96 43 96 96l0 256c0 53-43 96-96 96l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32z" fill="grey"/></svg>
        </a>
      </div>
    </div>
  </div>
  
</body>
</html>