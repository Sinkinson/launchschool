document.addEventListener('DOMContentLoaded', () => {
  let dateList = document.querySelector('ul');

  function getDates() {
    return new Promise(resolve => {
      const request = new XMLHttpRequest();
      request.open('GET', 'http://localhost:3000/api/bookings');
      request.responseType = 'json';
      request.send();
      request.addEventListener('load', () => resolve(request.response));
    });
  }

  (async function addDates() {
    let dates = await getDates();

    dates.forEach(date => {
      let li = document.createElement('li');
      li.textContent = date;
      dateList.appendChild(li);
    });

    document.body.appendChild(dateList);
  })();

  dateList.addEventListener('click', (event) => {
    let dateEl = event.target;
    let date = dateEl.textContent;
    const request = new XMLHttpRequest();
    request.open('GET', `http://localhost:3000/api/bookings/${date}`);
    request.responseType = 'json';
    request.send();

    request.addEventListener('load', () => {
      let bookings = request.response;
      let ul = document.createElement('ul');

      bookings.forEach(booking => {
        let li = document.createElement('li');
        li.textContent = booking.join(' | ');
        ul.appendChild(li);
      });

      dateEl.appendChild(ul);
    });
  });
});
