const rlSync = require('readline-sync');
const METERS = 'meters';
const FEET = 'feet';

let unit;

do {
  console.log('What unit would you like to use, meters or feet?')
  unit = rlSync.prompt();
  if (unit !== METERS || unit !== FEET) {
    console.log('Please just enter meters or feet')
  }
} while (unit !== METERS && unit !== FEET);

console.log('Enter the length of the room in meters:')
let length = rlSync.prompt();
length = Number(length);

console.log('Enter the width of the room in meters:')
let width = rlSync.prompt();
width = Number(width);

let area = (length * width).toFixed(2);

if (unit === 'meters') {
  displayMeters(length, width);
} else {
  displayFeet(length, width);
}

function displayMeters(length, width) {
  let sentence = `The area of the room is ${area} square meters`
  console.log(sentence);
}

function displayFeet(length, width) {
  let sentence = 'The area of the room is ${area} square feet'
}
