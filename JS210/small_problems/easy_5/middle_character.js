/*

Write a function that takes a non-empty string argument and returns the middle character(s) of the string.
If the string has an odd `length`, you should return exactly one character. If the string has an even `length`,
you should return exactly two characters.

*/

function centerOf(string) {
  if (string.length % 2 === 1) {
    let mid = Math.floor(string.length / 2);
    console.log(string[mid]);
  } else {
    let mid = Math.floor(string.length / 2) - 1;
    console.log(string.slice(mid, mid + 2));
  }
}

centerOf('I Love JavaScript'); // "a"
centerOf('Launch School');     // " "
centerOf('Launch');            // "un"
centerOf('Launchschool');      // "hs"
centerOf('x');                 // "x"
