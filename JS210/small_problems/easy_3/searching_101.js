/*

Write a program that solicits six numbers from the user and logs a message that describes whether the sixth number appears among the first five numbers.

*/

let readline = require('readline-sync');

function searching() {
  let numbers = getNumbers();
  let firstFive = numbers.slice(0, 5);
  let lastNum = numbers[numbers.length - 1];
  if (firstFive.includes(lastNum)) {
    console.log(`The number ${lastNum} appears in [${firstFive.join(', ')}]`);
  } else {
    console.log(`The number ${lastNum} does not appear in ${firstFive}`);
  }
}

function getNumbers() {
  let numbers = [];

  for (let i = 0; i < 6; i += 1) {
    let numAndSuffix = getSuffix(i + 1);
    let number = +(readline.question(`Enter the ${numAndSuffix} number: `));
    numbers.push(number);
  }

  return numbers;
}

function getSuffix(num) {
  switch (num) {
    case 1: return num + 'st';
    case 2: return num + 'nd';
    case 3: return num + 'rd';
    case 6: return 'last'
    default: return num + 'th'
  }
}

searching();
