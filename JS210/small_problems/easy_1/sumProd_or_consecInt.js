/*

Write a program that asks the user to enter an integer greater than 0, then asks
if the user wants to determine the sum or the product of all numbers between 1 and
the entered integer, inclusive.

Examples:
Please enter an integer greater than 0: 5
Enter "s" to compute the sum, or "p" to compute the product. s

The sum of the integers between 1 and 5 is 15.

Please enter an integer greater than 0: 6
Enter "s" to compute the sum, or "p" to compute the product. p

The product of the integers between 1 and 6 is 720.

*/

let rlSync = require('readline-sync');

function getInteger() {
  let num;
  do {
    console.log('Please enter an integer greater than 0:');
    num = Number(rlSync.prompt());
  } while (num < 0);
  return num;
}

function sumOrProduct() {
  let answer;
  do {
    console.log('Enter "s" to compute the sum, or "p" to computer the product.')
    answer = rlSync.prompt();
  } while (answer !== 'p' && answer !== 's');
  return answer;
}

function buildRange(num) {
  let result = [];
  for (let i = 1; i <= num; i += 1) {
    result.push(i);
  }
  return result;
}

function calculateSum(range) {
  return range.reduce((accumulator, element) => accumulator + element);
}

function calculateProduct(range) {
  return range.reduce((accumulator, element) => accumulator * element);
}

function consecutiveIntegers() {
  let num = getInteger();
  let choice = sumOrProduct().toLowerCase();
  let range = buildRange(num);
  if (choice === 's') {
    console.log(calculateSum(range));
  } else {
    console.log(calculateProduct(range));
  }
}

consecutiveIntegers();
