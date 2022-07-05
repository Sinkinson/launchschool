function isPalindromicNumber(num) {
  let strNum = num.toString();
  console.log(strNum === strNum.split('').reverse().join(''));
}

isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true
