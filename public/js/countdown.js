function productCardCountdown(productId, date) {
  const productCard = document.getElementById('product-' + productId);

  const hoursElement = productCard.querySelector('#hours');
  const minutesElement = productCard.querySelector('#minutes');
  const secondsElement = productCard.querySelector('#seconds');
  const countdownWrapper = productCard.querySelector('#countdown-wrapper');

  const endDate = new Date(date);

  setInterval(() => {
    var now = new Date();

    var timeDiff = endDate.getTime() - now.getTime();
    var seconds = Math.floor(timeDiff / 1000);
    var minutes = Math.floor(seconds / 60);
    var hours = Math.floor(minutes / 60);
    var days = Math.floor(hours / 24);

    hours %= 24;
    minutes %= 60;
    seconds %= 60;

    if (timeDiff <= 0) {
      countdownWrapper.innerHTML = 'Auction ended';
      countdownWrapper.className = 'text-base font-semibold';
    } else {
      hoursElement.style = '--value:' + (hours + Math.floor(days * 24));
      minutesElement.style = '--value:' + minutes;
      secondsElement.style = '--value:' + seconds;

      hours === 0
        ? (hoursElement.className = 'opacity-60')
        : (hoursElement.className = '');

      minutes === 0 && hours === 0
        ? (minutesElement.className = 'opacity-60')
        : (minutesElement.className = '');

      seconds === 0 && minutes === 0 && hours === 0
        ? (secondsElement.className = 'opacity-60')
        : (secondsElement.className = '');
    }
  }, 1000);
}

function productCountdown(date) {
  const parent = document.getElementById('actions');

  const hoursElement = parent.querySelector('#hours');
  const minutesElement = parent.querySelector('#minutes');
  const secondsElement = parent.querySelector('#seconds');
  const countdownWrapper = parent.querySelector('#countdown-wrapper');
  const radialProgress = parent.querySelector('#radial-progress');

  const endDate = new Date(date);

  setInterval(() => {
    var now = new Date();

    var timeDiff = endDate.getTime() - now.getTime();
    var seconds = Math.floor(timeDiff / 1000);
    var minutes = Math.floor(seconds / 60);
    var hours = Math.floor(minutes / 60);
    var days = Math.floor(hours / 24);

    hours %= 24;
    minutes %= 60;
    seconds %= 60;

    if (timeDiff <= 0) {
      countdownWrapper.innerHTML = 'Auction ended';
      countdownWrapper.className = 'text-3xl font-semibold';
      radialProgress.classList.add('hidden');
      return;
    }
    
    if (hours === 0 && (minutes === 0 && seconds <= 60)) {
      countdownWrapper.classList.add('hidden');
      radialProgress.classList.remove('hidden');

      var percentage = (seconds / 60) * 100;
      radialProgress.style = '--value:' + percentage;
      radialProgress.innerHTML = seconds;
      return;
    }

    hoursElement.style = '--value:' + (hours + Math.floor(days * 24));
    minutesElement.style = '--value:' + minutes;
    secondsElement.style = '--value:' + seconds;

    hours === 0
      ? (hoursElement.className = 'opacity-60')
      : (hoursElement.className = '');
    
  }, 1000);
}
