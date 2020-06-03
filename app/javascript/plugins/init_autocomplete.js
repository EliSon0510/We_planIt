import places from 'places.js';

const initAutocomplete = () => {
  const destinationInput = document.getElementById('trip_destination');
    const destinationInputSearch = document.getElementById('search-bar');
    if (destinationInputSearch) {
    places({ container: destinationInputSearch }).configure({language: "en", type: "country"});
  }
  if (destinationInput) {
    places({ container: destinationInput}).configure({language: "en", type: "country"});
  }
};


export { initAutocomplete};

