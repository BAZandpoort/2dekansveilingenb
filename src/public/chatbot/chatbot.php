

<div id="bot" class="m-2 h-96 w-80 bg-white flex items-center justify-center shadow-xl">
  <div id="container" class="h-4/5 w-4/5 border-2xl">
    <div id="header" class="text-4xl text-center">
        Chatbot
    </div>

    <div id="body" class="w-full h-4/5 overflow-y-auto">
        <div class="userSection w-full">
          <div class="messages user-message">

          </div>
          <div class="seperator w-full h-50"></div>
        </div>
        <div class="botSection">
          <div class="messages bot-reply">

          </div>
          <div class="seperator"></div>
        </div>                
    </div>

    <div id="inputArea" class="flex justify-center items-center	">
      <input type="text" placeholder="Type here" name="messages" class="input input-bordered w-full max-w-xs" id="userInput" required/>
      
      <input type="submit" value="Submit" class="btn" id="send"/>
    </div>
  </div>
  </div>
 
<script type="text/javascript">

      document.querySelector("#send").addEventListener("click", async () => {

        let xhr = new XMLHttpRequest();
        var userMessage = document.querySelector("#userInput").value


        let userHtml = '<div class="chat chat-start">
  <div class="chat-bubble">'+ userMessage+'</div>
</div>'
        
        

       
        document.querySelector('#body').innerHTML+= userHtml;

        xhr.open("POST", "/src/lib/chatbot/chatbot.php");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(`messageValue=${userMessage}`);


        xhr.onload = function () {
            let botHtml = '<div class="botSection">'+'<div class="messages bot-reply">'+this.responseText+'</div>'+
            '<div class="seperator"></div>'+'</div>'

            document.querySelector('#body').innerHTML+= botHtml;
        }

      })

  </script>