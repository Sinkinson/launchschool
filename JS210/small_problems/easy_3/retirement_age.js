let readline = require('readline-sync');

function retirement() {
  let currentAge = +(readline.question('What is your age? '));
  let retirementAge = +(readline.question('What age would you like to retire? '));
  let difference = retirementAge - currentAge;
  let year = new Date().getFullYear();

  console.log(`It's ${year}. You will retire in ${year + difference}`);
  console.log(`You have only ${difference} years of work to go!`);
}

retirement();
