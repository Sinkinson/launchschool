/*

Write a function that combines two arrays passed as arguments, and returns a new array that
contains all elements from both array arguments, with each element taken in alternation.

You may assume that both input arrays are non-empty, and that they have the same number of elements.

*/

function interleave(arr1, arr2) {
  let result = [];

  for (let idx = 0; idx < arr1.length; idx += 1) {
    result.push(arr1[idx]);
    result.push(arr2[idx]);
  }

  return result;
}

interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]

// option 2

function interleave(array1, array2) {
  const newArray = [];

  for (let i = 0; i < array1.length; i += 1) {
    newArray.push(array1[i], array2[i]);
  }

  return newArray;
}
