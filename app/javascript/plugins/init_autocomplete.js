import places from 'places.js';

const initAutocomplete = () => {
  const destinationInput = document.getElementById('trip_destination');
    const destinationInputSearch = document.getElementById('search-bar');
    if (destinationInputSearch) {
    places({ container: destinationInputSearch });
  }
  if (destinationInput) {
    places({ container: destinationInput });
  }
};


export { initAutocomplete};

