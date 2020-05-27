import places from 'places.js';

const initAutocomplete = () => {
  const destinationInput = document.getElementById('trip_destination');
  if (destinationInput) {
    places({ container: destinationInput });
  }
};

export { initAutocomplete };
