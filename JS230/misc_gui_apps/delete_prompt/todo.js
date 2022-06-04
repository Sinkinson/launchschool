todo_items = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John '}
];

class Todos {
  constructor() {
    this.list = document.getElementById('todos');
    this.modalLayer = document.getElementById('modal-layer');
    this.modal = document.getElementById('modal');
    this.items = todo_items;
    this.todoId = null;
    this.addTodos()
    this.bindEvents();
  }

  bindEvents() {
    this.list.addEventListener('click', this.showModal.bind(this));
    this.modal.addEventListener('click', this.handleDeletion.bind(this));
  }

  showModal(e) {
    this.modalLayer.classList.replace('hide', 'show');
    this.modal.classList.replace('hide', 'show');
    this.todoId = e.target.parentElement.dataset.id;
  }

  hideModal() {
    this.modalLayer.classList.replace('show', 'hide');
    this.modal.classList.replace('show', 'hide');
  }

  handleDeletion(e) {
    if (e.target.tagName === 'BUTTON') {
      let result = e.target.value;
      if (result === 'yes') {
        document.querySelector(`[data-id='${this.todoId}']`).remove();
        this.hideModal();
      } else {
        this.hideModal();
      }
    }
  }

  addTodos() {
    this.items.forEach(item => {
      this.list.append(this.todoTemplate(item));
    })
  }

  todoTemplate(item) {
    let todo = document.createElement('li');
    let deleteBtn = document.createElement('button');

    todo.setAttribute('data-id', item.id);
    todo.textContent = item.title;

    deleteBtn.setAttribute('type', 'button');
    deleteBtn.classList.add('deleteBtn');
    deleteBtn.textContent = 'Delete';

    todo.appendChild(deleteBtn);
    return todo;
  }
}

document.addEventListener('DOMContentLoaded', () => new Todos());
