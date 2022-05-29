function logInBox(string) {
  let length = string.length;
  displayTopLine(length);
  displayMiddleLine(string, length);
  displayBottomLine(length);
}

function displayTopLine(length) {
  console.log('+-' + '-'.repeat(length) + '-+');
  console.log('| ' + ' '.repeat(length) + ' |');
}

function displayMiddleLine(string) {
  console.log(`| ${string} |`);
}

function displayBottomLine(length) {
  console.log('| ' + ' '.repeat(length) + ' |');
  console.log('+-' + '-'.repeat(length) + '-+');
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
