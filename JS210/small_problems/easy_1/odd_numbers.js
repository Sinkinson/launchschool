for (let i = 1; i <= 99; i += 1) {
  if (i % 2 === 1) {
    console.log(i);
  }
}

// alternate option

function log_odd_numbers(max) {
  let i = 1;
  while (i < max) {
    console.log(i)
    i += 2
  }
}

log_odd_numbers(20);