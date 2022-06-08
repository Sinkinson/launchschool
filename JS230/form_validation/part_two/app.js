document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let errorMsg = document.getElementById('errorMsg')
  let inputs = Array.from(document.querySelectorAll('input'));

  inputs.forEach(input => {
    input.addEventListener('focus', event => {
      let target = event.target;
      target.parentElement.querySelector("[id*=Error]").textContent = '';
    });

    input.addEventListener('blur', event => {
      event.target.checkValidity();
    });

    input.addEventListener('invalid', event => {
      let target = event.target;
      let validityObj = target.validity;
      let error = target.nextElementSibling;

      if (validityObj.valueMissing) {
        error.textContent = 'Field required';
      } else if (validityObj.patternMistmatch || validityObj.typeMismatch) {
        error.textContent = 'Invalid input';
      }
    });

    if (input.id === 'firstName' || input.id === 'lastName') {
      input.addEventListener('keypress', (e) => {
        let key = e.key;
        if (!(key.match(/[a-zA-Z]+/))) e.preventDefault();
      });
    }

    if (input.name === 'creditCard') {
      input.addEventListener('keypress', (e) => {
        let key = e.key;
        if (!(key.match(/[0-9]+/))) e.preventDefault();
      });
    }

    if (input.name === 'phoneNo') {
      input.addEventListener('keypress', (e) => {
        let key = e.key;
        if (!(key.match(/[-0-9]+/))) e.preventDefault();
      });
    }
  });

  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      errorMsg.textContent = 'Form cannot be submitted until errors corrected'; 
    }
  });
});
