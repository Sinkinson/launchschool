document.addEventListener('DOMContentLoaded', function() {
  let answer = document.querySelector('#answer');
  let calculator = document.querySelector('#calculator');

  calculator.addEventListener('submit', function(e) {
    e.preventDefault();
    let data = new FormData(calculator);
    let num1 = +(data.get('firstNo'));
    let num2 = +(data.get('secondNo'));
    let operation = data.get('operation');

    
    answer.textContent = (() => {
      switch(operation) {
        case '+': return String(num1 + num2);
        case '-': return String(num1 - num2);
        case '*': return String(num1 * num2);
        case '/': return String(num1 / num2);
      }
    })();
  });
});
