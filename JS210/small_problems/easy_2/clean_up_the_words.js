/*

Given a string that consists of some words and an assortment of non-alphabetic characters,
write a function that returns that string with all of the non-alphabetic characters replaced
by spaces. If one or more non-alphabetic characters occur in a row, you should only have one
space in the result (i.e., the result string should never have consecutive spaces).

*/

function cleanUp(string) {
  let result = '';
  const REGEXP = /[a-zA-Z]/;

  for (let idx = 0; idx < string.length; idx += 1) {
    if (REGEXP.test(string[idx])) {
      result += string[idx];
    } else if (string[idx] === ' ' && result[result.length - 1] !== ' ') {
      result += ' ';
    } else if (result[result.length - 1] !== ' ')
      result += ' ';
    }
  
  return result;
}

cleanUp("---what's my +*& line?");    // " what s my line "
