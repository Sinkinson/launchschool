document.addEventListener('DOMContentLoaded', () => {
  let scheduleList = document.querySelector('#schedule_list');
  let booking_form = document.forms.booking_form;
  let student_form = document.forms.new_student_form;
  let newStudentDiv = document.querySelector('#new_student_box');

  (() => {
    function getStaffName(staff_id) {
      return new Promise((resolve) => {
        function getStaffMembers() {
          let staff = JSON.parse(request.response);
          let target = staff.find(({id}) => id === staff_id);
          resolve(target.name);
        }
  
        const request = new XMLHttpRequest();
        request.open('GET', 'http://localhost:3000/api/staff_members');
        
        request.addEventListener('load', getStaffMembers);
        request.send();
      });
    }
    
    function addSchedules() {
      const request = new XMLHttpRequest();
      request.open('GET', 'http://localhost:3000/api/schedules');

      request.addEventListener('load', () => {
        let schedules = JSON.parse(request.response);

        schedules.forEach(async (schedule) => {
          let staffName = await getStaffName(schedule.staff_id);
          let text = `${staffName} | ${schedule.date} | ${schedule.time}`;
          let el = document.createElement('option');
          el.setAttribute('value', schedule.id);
          el.textContent = text;
          scheduleList.appendChild(el);
        });
      });

      request.send();
    }

    addSchedules();
  })();

  function displayNewStudentForm(text, data) {
    let bookingSeqEl = document.querySelector('#booking_sequence');
    let emailEl = document.querySelector('[name="email"]');
    bookingSeqEl.value = +(text.match(/\b\d+\b/)[0]);
    emailEl.value = data.get("student_email");
    newStudentDiv.style.display = 'block';
  }

  booking_form.addEventListener('submit', event => {
    event.preventDefault();
    let data = new FormData(booking_form);
    let request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:3000/api/bookings');
    
    request.addEventListener('load', () => {
      let status = request.status;
      let text = request.responseText;

      if (status === 204) {
        alert('booked');
        booking_form.reset();
      } else if (status === 404 && !text.includes('booking_sequence')) {
        alert(text);
      } else if (status === 404) {
        alert(text);
        displayNewStudentForm(text, data);
      }
    });

    request.send(data);
  });

  student_form.addEventListener('submit', event => {
    event.preventDefault();
    let data = new FormData(student_form);
    let request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:3000/api/students');
    
    request.addEventListener('load', event => {
      if (request.status === 201) {
        alert(request.responseText);
        const submit = new SubmitEvent("submit");
        booking_form.dispatchEvent(submit);
        student_form.reset();
        newStudentDiv.style.display = 'none';
      } else {
        alert(request.responseText);
      }
    });

    request.send(data);
  })
});
