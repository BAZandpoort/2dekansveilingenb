<style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Rubik&display=swap');

body{
  margin: 0;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: "Rubik", sans-serif;
}


#bot {
  margin: 50px 0;
  height: 700px;
  width: 450px;
  background: white;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2) ;
  border-radius: 20px;
}


#container {
  height: 90%;
  border-radius: 6px;
  width: 90%;
  background: #F3F4F6;
}

#header {
  width: 100%;
  height: 10%;
  border-radius: 6px;
  background: #3B82F6;
  color: white;
  text-align: center;
  font-size: 2rem;
  padding-top: 12px;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

#body {
  width: 100%;
  height: 75%;
  background-color: #F3F4F6;
  overflow-y: auto;
}

.userSection {
  width: 100%;
}

.seperator {
  width: 100%;
  height: 50px;
}

.messages {
  max-width: 60%;
  margin: .5rem;
  font-size: 1.2rem;
  padding: .5rem;
  border-radius: 7px;
}

.user-message {
  margin-top: 1rem;
  text-align: left;
  background: #3B82F6;
  color: white;
  float: left;
}

.bot-reply {
  text-align: right;
  background: #E5E7EB;
  margin-top: 1rem;
  float: right;
  color: black;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

#inputArea {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 10%;
  padding: 1rem;
  background: transparent;
}

#userInput {
  height: 20px;
  width: 80%;
  background-color: white;
  border-radius: 6px;
  padding: 1rem;
  font-size: 1rem;
  border: none;
  outline: none;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

#send {
  height: 50px;
  padding: .5rem;
  font-size: 1rem;
  text-align: center;
  width: 20%;
  color: white;
  background: #3B82F6;
  cursor: pointer;
  border: none;
  border-radius: 6px;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}
</style>
<details class="dropdown text-center">
  <summary class="m-1 btn">open</summary>
  <div id="bot">
  <div id="container">
    <div id="header">
        Chatbot
    </div>

    <div id="body">
        <div class="userSection">
          <div class="messages user-message">

          </div>
          <div class="seperator"></div>
        </div>
        <div class="botSection">
          <div class="messages bot-reply">

          </div>
          <div class="seperator"></div>
        </div>                
    </div>

    <div id="inputArea">
      <input type="text" name="messages" id="userInput" placeholder="Please enter your message here" required>
      <input type="submit" id="send" value="Send">
    </div>
  </div>
  </div>
 
</details>

<script type="text/javascript">

      document.querySelector("#send").addEventListener("click", async () => {

        let xhr = new XMLHttpRequest();
        var userMessage = document.querySelector("#userInput").value


        let userHtml = '<div class="userSection">'+'<div class="messages user-message">'+userMessage+'</div>'+
        '<div class="seperator"></div>'+'</div>'


        document.querySelector('#body').innerHTML+= userHtml;

        xhr.open("POST", "query.php");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(`messageValue=${userMessage}`);


        xhr.onload = function () {
            let botHtml = '<div class="botSection">'+'<div class="messages bot-reply">'+this.responseText+'</div>'+
            '<div class="seperator"></div>'+'</div>'

            document.querySelector('#body').innerHTML+= botHtml;
        }

      })

  </script>