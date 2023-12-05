const searchBar = document.querySelector('.users .search input');

async function fetchChats() {
  const usersList = document.querySelector('.users .users-list');

  try {
    const response = await fetch('/src/lib/chats/get-user-chats.php');
    if (response.ok) {
      const data = await response.text();
      if (!searchBar.classList.contains('active')) {
        usersList.innerHTML = data;
      }
    }
  } catch (error) {
    console.log('There has been a problem with the fetch operation: ', error);
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