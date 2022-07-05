/*

Write a function that takes a year as input and returns the century. The return value
should be a string that begins with the century number, and ends with `'st'`, `'nd'`,
`'rd'`, or `'th'` as appropriate for that number.

New centuries begin in years that end with `01`. So, the years 1901 - 2000 comprise
the 20th century.

*/

function findCentury(year) {
  let str;
  let century = Math.ceil(year / 100);

  if (century < 21) {
    str = findAppendenture(century);
  } else {
    let strCent = String(century);
    let lastTwoDigits = +(strCent.substr(1));
    str = findAppendenture(lastTwoDigits);
  }

  console.log(`${century}${str}`);
}

function findAppendenture(lastDigit) {
  if (lastDigit === 1) return 'st';
  if (lastDigit === 2) return 'nd';
  if (lastDigit === 3) return 'rd';
  if (lastDigit > 3) return 'th';
}

findCentury(2001);        // "21st"
findCentury(2000);        // "20th"
findCentury(1965);        // "20th"
findCentury(256);         // "3rd"
findCentury(5);           // "1st"
findCentury(10103);       // "102nd"
findCentury(1052);        // "11th"
findCentury(1127);        // "12th"
findCentury(11201);       // "113th"
