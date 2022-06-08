document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let errorMsg = document.getElementById('errorMsg')
  let inputs = Array.from(document.querySelectorAll('input'));

  inputs.forEach(input => {
    input.addEventListener('focus', event => {
      let target = event.target;
      let error = target.parentElement.querySelector("[id*=Error]");
      if (error) error.textContent = '';
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
    event.preventDefault();

    if (!form.checkValidity()) {
      errorMsg.textContent = 'Form cannot be submitted until errors corrected'; 
    } else {
      let keysAndValues = [];
      let ccValue = '';

      for (let idx = 0; idx < form.elements.length; idx += 1) {
        let element = form.elements[idx];
        let types = ['text', 'email', 'password', 'tel'];

        if (types.includes(element.type)) {
          if (element.name === 'creditCard') {
            ccValue += element.value;
          } else {
            let key = encodeURIComponent(element.name);
            let value = encodeURIComponent(element.value);
            keysAndValues.push(`${key}=${value}`);
          }
        }
      }

      keysAndValues.push(`creditCard=${ccValue}`);
      let data = keysAndValues.join('&');

      let request = new XMLHttpRequest();
      request.open('POST', 'url');
      request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      // request.send(data); this would be normal operation
      // we'll just display data in block for now
      document.getElementById('formData').textContent = data;
    }
  });

  (function addTabForwarding() {
    let cardInputs = Array.from(document.querySelectorAll("[name='creditCard']")).slice(0, -1);
    cardInputs.forEach(input => {
      input.addEventListener('keyup', (e) => {
        let value = input.value;
        let next = input.nextElementSibling.nextElementSibling;
        if (value.length === 4) next.focus();
      });
    });
  })();
});
