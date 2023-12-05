const form = document.querySelector(".typing-area"),
inputField = form.querySelector(".input-field"),
sendBtn = form.querySelector("button"),
chatBox = document.querySelector(".chat-box");

function scrollToBottom() {
    chatBox.scrollTop = chatBox.scrollHeight;
}

form.onsubmit = (e) => {
    e.preventDefault();
}

const sendRequest = async (url, formData) => {
    const response = await fetch(url, {
        method: 'POST',
        body: formData
    });

    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    } else {
        return await response.text();
    }
}

sendBtn.onclick = async () => {
    const formData = new FormData(form);
    try {
        await sendRequest("/src/lib/chats/insert-chat.php", formData);
        inputField.value = "";
        scrollToBottom();
    } catch (error) {
        console.error('There was a problem with the request:', error);
    }
}

chatBox.onmouseenter = () => {
    chatBox.classList.add("active");
}

chatBox.onmouseleave = () => {
    chatBox.classList.remove("active");
}

setInterval(async () => {
    const formData = new FormData(form);
    try {
        const data = await sendRequest("/src/lib/chats/get-chat.php", formData);
        chatBox.innerHTML = data;
        if (!chatBox.classList.contains("active")) {
            scrollToBottom();
        }
    } catch (error) {
        console.error('There was a problem with the request:', error);
    }
}, 1000);