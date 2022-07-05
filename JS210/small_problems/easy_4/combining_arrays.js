/*

Write a function that takes two arrays as arguments and returns an array containing the union
of the values from the two. There should be no duplication of values in the returned array, even
if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

*/

function union(arr1, arr2) {
  let result = [...arr1];

  arr2.forEach(element => {
    if (result.indexOf(element) === -1) result.push(element);
  });

  console.log(result);
}

union([1, 3, 5], [3, 6, 9]); // [1, 3, 5, 6, 9]

// option 2

function union(arr1, arr2) {
  let result = [...arr1, ...arr2];

  result = result.filter(function(value, index) {
    return result.indexOf(value) === index;
  });

  console.log(result);
}
