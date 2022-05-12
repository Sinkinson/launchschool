function createStaffMember(event) {
  event.preventDefault();

  let data = new FormData(this);
  let request = new XMLHttpRequest();
  request.open('POST', this.action);

  request.addEventListener('load', () => {
    if (request.status === 201) {
      let id = JSON.parse(request.response).id
      alert(`Successfully created staff with id: ${id}`);
    } else if (request.status === 400) {
      alert(request.responseText);
    }
  });

  request.send(data);
}

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('#form');
  form.addEventListener('submit', createStaffMember);
});
