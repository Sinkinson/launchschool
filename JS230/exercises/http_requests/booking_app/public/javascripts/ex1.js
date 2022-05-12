function getSchedules() {
  const request = new XMLHttpRequest();

  request.open('GET', 'http://localhost:3000/api/schedules');
  request.timeout = 5000;
  request.responseType = 'json';

  request.addEventListener('load', (event) => {
    let schedules = request.response;
    let result;

    if (schedules.length > 0) {
      result = schedules.reduce((result, {staff_id}) => {
        result[`Staff ${staff_id}`] = result[`Staff ${staff_id}`] || 0;
        result[`Staff ${staff_id}`] += 1;
        return result;
      }, {});
    } else {
      alert('There are currently no schedules available for booking');
      return;
    }

    result = Object.entries(result).map(([key, value]) => `${key}: ${value}`).join('\n');
    alert(result);
  });

  request.addEventListener('timeout', () => {
    alert('The request has timed out. Please try again.');
  });

  request.addEventListener('loadend', () => {
    alert('Request complete.');
  });

  request.send();
}

document.addEventListener('DOMContentLoaded', () => {
  getSchedules();
});
