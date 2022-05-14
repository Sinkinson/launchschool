// I haven't made this code dry for the sake of practise

function cancelSchedule(id) {
  const request = new XMLHttpRequest();
  request.open('DELETE', `/api/schedules/${id}`);
  request.send();
  request.addEventListener('load', () => {
    if (request.status === 204) {
      alert(`Schedule ${id} deleted`);
    } else {
      alert(request.responseText);
    }
  });
}

function cancelBooking(id) {
  const request = new XMLHttpRequest();
  request.open('PUT', `/api/bookings/${id}`);
  request.send();
  request.addEventListener('load', () => {
    if (request.status === 204) {
      alert(`Booking ${id} deleted`)
    } else {
      alert(request.responseText);
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  let scheduleList = document.querySelector('#schedule_list');
  let bookingList = document.querySelector('#booking_list');
  let scheduleForm = document.forms.delete_schedule;
  let bookingForm = document.forms.delete_booking;
  
  async function main() {
    let schedules = await getSchedules();
    let bookings = getBookings(schedules);
    addSchedules(schedules);
    addBookings(bookings);
    scheduleForm.addEventListener('submit', removeSchedule);
    bookingForm.addEventListener('submit', removeBooking);
  }

  function removeSchedule(event) {
    event.preventDefault();
    let data = new FormData(scheduleForm);
    let id = data.get('schedule_id');
    cancelSchedule(id);
    location.reload();
  }

  function getSchedules() {
    return new Promise(resolve => {
      const request = new XMLHttpRequest();
      request.open('GET', '/api/schedules');
      request.responseType = 'json';
      request.send();
      request.addEventListener('load', () => resolve(request.response));
    });
  }

  function addSchedules(schedules) {
    schedules.forEach(({id, staff_id, date, time}) => {
      let option = document.createElement('option');
      option.value = id;
      option.textContent = `Staff id: ${staff_id} | ${date} | ${time}`;
      scheduleList.appendChild(option);
    });    
  }

  function getBookings(schedules) {
    return schedules.filter(({student_email}) => student_email);
  }

  function addBookings(bookings) {
    bookings.forEach(({id, student_email, date, time}) => {
      let option = document.createElement('option');
      option.value = id;
      option.textContent = `${student_email} | ${date} | ${time}`
      bookingList.appendChild(option);
    });
  }

  function removeBooking(event) {
    event.preventDefault();
    let data = new FormData(bookingForm);
    let id = data.get('schedule_id');
    cancelBooking(id);
    location.reload();
  }

  main();
});
