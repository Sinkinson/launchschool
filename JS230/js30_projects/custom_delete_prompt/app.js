class Controller {
  constructor() {
    this.view = new View();
    this.model = new Model();
    this.bindEvents();
    this.loadHomepage();
  }

  bindEvents() {
    this.view.bindConfirmation(this.deleteTodo, this.loadHomepage);
    this.model.bindTodoListChange(this.loadHomepage);
  }

  loadHomepage = () => this.view.refreshHomepage(this.model.todos);

  deleteTodo = (id) => this.model.delete(id);
}

class View {
  constructor() {
    this.main = document.getElementById('root');
    this.todoList = document.createElement('div', 'todoList');
    this.templates = this.createTemplates();
    this.confirmationPrompt = this.buildConfirmationPrompt();
    this.bindEvents();
  }

  bindEvents() {
    this.todoList.addEventListener('click', this.showConfirmationPrompt.bind(this));
  }

  bindConfirmation(deleteHandler, refreshHomepageHandler) {
    this.confirmationPrompt.addEventListener('click', e => {
      let target = e.target;
      if (target.tagName !== 'BUTTON') return;
      let answer = target.id;
      if (answer === 'yes') {
        this.clearHomepage();
        deleteHandler(this.currentId);
      } else {
        refreshHomepageHandler();
      }
    });
  }

  clearHomepage() {
    this.todoList.remove();
    this.todoList.textContent = '';
    this.confirmationPrompt.remove();
  }

  showConfirmationPrompt(e) {
    let target = e.target;
    if (target.tagName !== 'BUTTON') return;
    this.currentId = target.dataset.id;
    this.main.append(this.confirmationPrompt);
  }

  buildConfirmationPrompt() {
    let html = this.templates.confirmationPromptTemplate();
    let modalLayer = document.createElement('div');
    modalLayer.setAttribute('id', 'modalLayer');
    modalLayer.insertAdjacentHTML('afterbegin', html);
    return modalLayer;
  }

  createElement(tag, id) {
    let element = document.createElement(tag);
    element.setAttribute('id', id);
    return element;
  }

  createTemplates() {
    let todoListHtml = document.getElementById('todoListTemplate').innerHTML;
    let todoHtml = document.getElementById('todoTemplate').innerHTML;
    Handlebars.registerPartial('todoTemplate', todoHtml);
    let confirmationPromptHtml = document.getElementById('confirmationPromptTemplate').innerHTML;

    return {
      todoListTemplate: Handlebars.compile(todoListHtml),
      todoTemplate: Handlebars.compile(todoHtml),
      confirmationPromptTemplate: Handlebars.compile(confirmationPromptHtml),
    };
  }

  refreshHomepage(todos) {
    this.clearHomepage();
    let html = this.templates.todoListTemplate({todos: todos});
    this.todoList.insertAdjacentHTML('afterbegin', html);
    this.main.append(this.todoList);
  }
}

class Model {
  constructor() {
    this.todos = this.getAllTodos();
  }

  bindTodoListChange(callback) {
    this.onTodoListChange = callback;
  }

  getAllTodos() {
    return [
      { id: 1, title: 'Homework' },
      { id: 2, title: 'Shopping' },
      { id: 3, title: 'Calling Mom' },
      { id: 4, title: 'Coffee with John '}
    ];
  }

  delete(todoId) {
    this.todos = this.todos.filter(({id}) => id !== +todoId);
    this.onTodoListChange();
  }
}

document.addEventListener('DOMContentLoaded', new Controller());
