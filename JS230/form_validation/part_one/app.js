document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let errorMsg = document.getElementById('errorMsg')
  let inputs = Array.from(document.querySelectorAll('input'));

  inputs.forEach(input => {
    input.addEventListener('focus', event => {
      let target = event.target;
      target.nextElementSibling.textContent = '';
    });

    input.addEventListener('blur', event => {
      event.target.checkValidity(); // Will fire invalid event on element if it returns false
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
  });

  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      errorMsg.textContent = 'Form cannot be submitted until errors corrected'; 
    }
  });
});
