/*

Write a function that takes two strings as arguments, determines the length of the two strings, and
then returns the result of concatenating the shorter string, the longer string, and the shorter string
once again. You may assume that the strings are of different lengths.

*/

function shortLongShort(str1, str2) {
  if (str2.length > str1.length) {
    let tmp = str1;
    str1 = str2;
    str2 = tmp;
  }

  return str2 + str1 + str2;
}

shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"

/*

Another option:

function shortLongShort(string1, string2) {
  if (string1.length > string2.length) {
    return string2 + string1 + string2;
  } else {
    return string1 + string2 + string1;
  }
}

*/
