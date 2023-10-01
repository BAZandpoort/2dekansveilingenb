function countdown(productId) {
  const productCard = document.getElementById('product-' + productId);

  const hoursElement = productCard.querySelector('#hours');
  const minutesElement = productCard.querySelector('#minutes');
  const secondsElement = productCard.querySelector('#seconds');

  const startDate = new Date('2023-10-01T16:00:00.000Z');
  const endDate = new Date('2023-10-02T16:00:00.000Z');

  const timeDiff = endDate.getTime() - startDate.getTime();
  const randomTime = Math.random() * timeDiff;
  const randomEndDate = new Date(startDate.getTime() + randomTime);

  setInterval(() => {
    var now = new Date();

    var timeDiff = randomEndDate.getTime() - now.getTime();
    var seconds = Math.floor(timeDiff / 1000);
    var minutes = Math.floor(seconds / 60);
    var hours = Math.floor(minutes / 60);

    hours %= 24;
    minutes %= 60;
    seconds %= 60;

    if (timeDiff <= 0) {
      hoursElement.style = '--value:00';
      minutesElement.style = '--value:00';
      secondsElement.style = '--value:00';
    } else {
      hoursElement.style = '--value:' + hours;
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
