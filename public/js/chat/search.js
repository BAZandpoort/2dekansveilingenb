const searchBar = document.querySelector('.users .search input');

searchBar.onkeyup = () => {
  const usersList = document.querySelector('.users .users-list');

  const searchTerm = searchBar.value;
  searchBar.value == ''
    ? searchBar.classList.remove('active')
    : searchBar.classList.add('active');

    debounce(() => searchUsers(usersList, searchTerm), 500);
};

let debounceTimeout;
function debounce(func, delay) {
    clearTimeout(debounceTimeout);
    debounceTimeout = setTimeout(func, delay);
}

async function searchUsers(usersList, searchTerm) {
  if (!searchTerm.trim()) {
    return;
  }

  try {
      let response = await fetch('/src/lib/chats/search.php', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: `searchTerm=${searchTerm}`
      });

      if (response.ok) {
          let data = await response.text();
          usersList.innerHTML = data;
      } else {
          console.error('HTTP Error: ' + response.status);
      }
  } catch (error) {
      console.error('There has been a problem with the fetch operation: ', error);
  }
}
