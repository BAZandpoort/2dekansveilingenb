const searchBar = document.querySelector(".users .search input");
const usersList = document.querySelector(".users .users-list");

searchBar.onkeyup = async () => {
    let searchTerm = searchBar.value;
    searchBar.classList.toggle("active", searchTerm !== "");

    const response = await fetch("/src/lib/chats/search.php", {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `searchTerm=${searchTerm}`
    });

    if (response.ok) {
        let data = await response.text();
        usersList.innerHTML = data;
    }
}

async function fetchChats() {
    const response = await fetch("/src/lib/chats/get-user-chats.php");

    if (response.ok && !searchBar.classList.contains("active")) {
        let data = await response.text();
        usersList.innerHTML = data;
    }
}

fetchChats();

// Recursive setTimeout for polling
(function poll() {
    setTimeout(async () => {
        await fetchChats();
        poll();
    }, 5000);
})();