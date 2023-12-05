usersList = document.querySelector(".button");

const urlParams = new URLSearchParams(window.location.search);
const productId = urlParams.get('id');

setInterval(()=>{
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/src/lib/chats/users.php?id=" + productId, true);
    xhr.onload = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                let data = xhr.response;
                usersList.innerHTML = data;
            }
        }
    }
    xhr.send();
}, 500);
