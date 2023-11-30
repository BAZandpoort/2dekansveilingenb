const searchBar = document.querySelector('.users .search input');

let debounceTimeout;
function debounce(func, delay) {
    clearTimeout(debounceTimeout);
    debounceTimeout = setTimeout(func, delay);
}

searchBar.onkeyup = () => {
    const searchTerm = searchBar.value;
    searchBar.value == ''
        ? searchBar.classList.remove('active')
        : searchBar.classList.add('active');

    debounce(() => searchUsers(searchTerm), 500);
};

async function searchUsers(searchTerm) {
    if (!searchTerm.trim()) {
        return;
    }

    try {
        const response = await fetch('/src/lib/chats/search.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `searchTerm=${encodeURIComponent(searchTerm)}`
        });

        if (response.ok) {
            const data = await response.text();
            const usersList = document.querySelector('.users .users-list');
            usersList.innerHTML = data;
        } else {
            console.error('HTTP Error: ' + response.status);
        }
    } catch (error) {
        console.error('There has been a problem with the fetch operation: ', error);
    }
}