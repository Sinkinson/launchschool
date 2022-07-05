/*

Write a function that takes a string argument containing one or more words and returns
a new string containing the words from the string argument. All five-or-more letter words
should have their letters in reverse order. The string argument will consist of only
letters and spaces. Words will be separated by a single space.

*/

function reverseWords(words) {
  let wordArr = words.split(' ');
  let result = [];

  wordArr.forEach(word => {
    if (word.length < 5) {
      result.push(word);
    } else {
      let revWord = word.split('').reverse().join('');
      result.push(revWord);
    }
  });

  return result.join(' ');
}

reverseWords('Professional');             // "lanoisseforP"
reverseWords('Walk around the block');    // "Walk dnuora the kcolb"
reverseWords('Launch School');            // "hcnuaL loohcS"
