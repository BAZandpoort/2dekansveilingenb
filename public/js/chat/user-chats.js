async function fetchChats() {
  const searchBar = document.querySelector('.users .search input');
  const usersList = document.querySelector('.users .users-list');

  try {
    let response = await fetch('/src/lib/chats/get-user-chats.php');
    if (response.ok) {
      let data = await response.text();
      if (!searchBar.classList.contains('active')) {
        usersList.innerHTML = data;
      }
    }
  } catch (error) {
    console.log('There has been a problem with the fetch operation: ', error);
  }
}

fetchChats();

setInterval(fetchChats, 5000);

