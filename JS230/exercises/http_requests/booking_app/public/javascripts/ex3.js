document.addEventListener('DOMContentLoaded', () => {
  let addScheduleBtn = document.querySelector('#scheduleBtn');
  let submitBtn = document.querySelector('#submitBtn');
  let formsContainer = document.querySelector('#forms_container');
  let baseForm = document.querySelector('#base_form');
  let allStaff;

  function addStaffNames() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:3000/api/staff_members');
    
    request.addEventListener('load', () => {
      allStaff = JSON.parse(request.response);
      let staffList = document.querySelector('#staff');
      allStaff.forEach(({name, id}) => {
        let option = document.createElement('option');
        option.setAttribute('value', id);
        option.textContent = name;
        staffList.appendChild(option);
      });
    });

    request.send();
  }

  function formDataToJson(forms) {
    let formsObject = { schedules: [] };

    forms.forEach(form => {
      let data = new FormData(form);
      let scheduleData = {};
      let dataEntries = data.entries();

      for (let [key, value] of dataEntries) {
        scheduleData[key] = value;
      }

      formsObject.schedules.push(scheduleData);
    });

    return JSON.stringify(formsObject);
  }

  addScheduleBtn.addEventListener('click', event => {
    event.preventDefault();
    let formClone = baseForm.cloneNode(true);
    formClone.querySelector('form').reset();
    formsContainer.appendChild(formClone);
  });

  submitBtn.addEventListener('click', event => {
    event.preventDefault();
    let forms = document.querySelectorAll('form');
    let data = formDataToJson(forms);

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:3000/api/schedules');
    request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

    request.addEventListener('load', () => {
      if (request.status === 201) forms.forEach(form => form.reset());
      alert(request.response);
    });

    request.send(data);
  });
 
  addStaffNames();
});
