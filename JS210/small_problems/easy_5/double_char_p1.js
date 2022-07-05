/*

Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

*/

function repeater(string) {
  let result = '';

  for (let idx = 0; idx < string.length; idx += 1) {
    result += string[idx].repeat(2);
  }

  return result;
}

repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
