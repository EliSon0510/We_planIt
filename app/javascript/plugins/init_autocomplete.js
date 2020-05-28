import places from 'places.js';

const initAutocomplete = () => {
  const destinationInput = document.getElementById('trip_destination');
  if (destinationInput) {
    places({ container: destinationInput });
  }
};


const initAutocompleteSearch = () => {
  const skills = JSON.parse(document.getElementById('search-data').dataset.skills)
  const searchInput = document.getElementById('trip_destination');
};

export { initAutocomplete };
