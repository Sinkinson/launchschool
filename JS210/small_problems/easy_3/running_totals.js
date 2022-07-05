/*

Write a function that takes an array of numbers and returns an array with the same number of elements, but with each element's value being the running total from the original array.

*/

function runningTotal(arr) {
  let currentTotal = 0;
  let result = [];

  for (let idx = 0; idx < arr.length; idx += 1) {
    currentTotal += arr[idx];
    result.push(currentTotal);
  }

  console.log(result);
}

runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []

// option 2

function runningTotal(arr) {
  let currentTotal = 0;
  let result = arr.map(num => (currentTotal += num));
  console.log(result);
}
