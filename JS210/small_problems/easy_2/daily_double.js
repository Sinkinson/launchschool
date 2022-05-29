function crunch(string) {
  result = '';

  for (let idx = 0; idx < string.length; idx += 1) {
    if (string[idx] === result[result.length - 1]) continue;
    result += string[idx];
  }

  console.log(result);
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
