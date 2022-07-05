/*

Build a program that randomly generates Ted's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

*/

const getAge = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

let sentence = `Ted is ${getAge(20, 200)} years old!`;

console.log(sentence);
