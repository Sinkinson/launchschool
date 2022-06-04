document.addEventListener('DOMContentLoaded', () => {
  class Todo {
    constructor() {
      this.list = document.getElementById('todos');
      this.items = this.todoItems();
      this.todoId = null;
      this.add();
    }

    add() {
      this.items.forEach(item => {
        this.list.append(this.todoTemplate(item));
      })
    }

    delete(e) {
      if (e.target.tagName === 'BUTTON') {
        let result = e.target.value;
        if (result === 'yes') {
          document.querySelector(`[data-id='${this.todoId}']`).remove();
          DialogBox.hide();
        } else {
          DialogBox.hide();
        }
      }
    }

    todoTemplate(item) {
      let todo = document.createElement('li');
      todo.setAttribute('data-id', item.id);
      todo.textContent = item.title;
      return todo;
    }

    todoItems() {
      return [
        { id: 1, title: 'Homework' },
        { id: 2, title: 'Shopping' },
        { id: 3, title: 'Calling Mom' },
        { id: 4, title: 'Coffee with John '}
      ];
    }
  }

  class DialogBox {
    static modalLayer = document.getElementById('modal-layer');
    static modal = document.getElementById('modal');

    static show() {
      this.modalLayer.classList.replace('hide', 'show');
      this.modal.classList.replace('hide', 'show');
    }

    static hide() {
      this.modalLayer.classList.replace('show', 'hide');
      this.modal.classList.replace('show', 'hide');
    }

    constructor(todos) {
      this.todos = todos;
      this.bindEvents();
    }

    bindEvents() {
      this.constructor.modal.addEventListener('click', this.todos.delete.bind(this.todos));
    }
  }

  class ContextMenu {
    constructor(todos) {
      this.todos = todos;
      this.contextMenu = document.getElementById('context-menu');
      this.bindEvents();
    }

    bindEvents() {
      this.todos.list.addEventListener('contextmenu', this.show.bind(this));
      document.addEventListener('click', this.hide.bind(this));
      this.contextMenu.addEventListener('click', this.handleClick.bind(this));
    }

    handleClick(e) {
      let li = e.target;
      if (li.id === 'delete') {
        DialogBox.show();
      }
    }

    show(e) {
      e.preventDefault();
      e.stopPropagation();

      if (e.target.tagName === 'LI') {
        this.contextMenu.style.position = 'absolute';
        this.contextMenu.style.left = e.pageX + 'px';
        this.contextMenu.style.top = e.pageY + 'px';
        this.contextMenu.classList.replace('hide', 'show');
        this.todos.todoId = e.target.dataset.id;
      }
    }

    hide(e) {
      e.preventDefault();
      this.contextMenu.classList.replace('show', 'hide');
    }
  }

  class App {
    constructor() {
      this.todos = new Todo();
      this.dialogBox = new DialogBox(this.todos);
      this.contextMenu = new ContextMenu(this.todos);
    }
  }

  new App();
});
