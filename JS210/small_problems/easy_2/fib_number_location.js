function findFibonacciIndexByLength(length) {
  let fibs = [1, 1];

  while (String(fibs[fibs.length - 1]).length < length) {
    let prevNum1 = BigInt(fibs[fibs.length - 1]);
    let prevNum2 = BigInt(fibs[fibs.length - 2]);
    let total = prevNum1 + prevNum2;
    
    fibs.push(BigInt(total));
  }

  return fibs.length;
}

findFibonacciIndexByLength(2n) === 7n;    // 1 1 2 3 5 8 13
findFibonacciIndexByLength(3n) === 12n;   // 1 1 2 3 5 8 13 21 34 55 89 144
findFibonacciIndexByLength(10n) === 45n;
findFibonacciIndexByLength(16n) === 74n;
findFibonacciIndexByLength(100n) === 476n;
findFibonacciIndexByLength(1000n) === 4782n;
findFibonacciIndexByLength(10000n) === 47847n;
