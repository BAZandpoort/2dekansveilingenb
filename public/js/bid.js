function bid() {
  const currentBidElement = document.getElementById('currentBid');
  const suggestedBidElement = document.getElementById('suggestedBid');
  const biddersElement = document.getElementById('bidders');
  const bidInputElement = document.getElementById('bidInput');

  const currentBid = parseFloat(currentBidElement.innerHTML.split('€')[1]);
  const suggestedBid = parseFloat(suggestedBidElement.innerHTML.split('€')[1]);
  const bidders = parseInt(biddersElement.innerHTML);

  const input = parseFloat(bidInputElement.value);

  if (isNaN(input)) {
    alert('Please enter a number');
    return;
  }

  if (input <= currentBid) {
    alert('Please enter a higher bid');
    return;
  }

  if (input > suggestedBid) {
    suggestedBidElement.innerHTML = `€${input}`;
  }

  currentBidElement.innerHTML = `€${input}`;
  biddersElement.innerHTML = bidders + 1;
}