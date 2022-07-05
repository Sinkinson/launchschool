/*

Modify the wordSizes function from the previous exercise to exclude non-letters when determining word size. For instance, the word size of "it's" is 3, not 4.

*/


function wordSizes(str) {
  let words = str.split(' ');
  let result = {};

  words.forEach(word => {
    let cleanWord = word.replace(/[^a-zA-Z]/g, '');
    let length = cleanWord.length;

    result[length] = result[length] || 0;
    result[length] += 1;
  });

  console.log(result);
}

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 2 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 3 }
wordSizes("What's up doc?");                              // { "5": 1, "2": 1, "3": 1 }
wordSizes('');                                            // {}
