/*

Write a function that takes a string, doubles every consonant character in the string, and
returns the result as a new string. The function should not double vowels ('a','e','i','o','u'),
digits, punctuation, or whitespace.

*/

function doubleConsonants(string) {
  let result = '';

  for (let idx = 0; idx < string.length; idx += 1) {
    let char = string[idx];
    if (/[a-zA-Z]/.test(char) && /[^aeiou]/.test(char)) {
      result += char.repeat(2);
    } else {
      result += char;
    }
  }

  return result;
}

doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
