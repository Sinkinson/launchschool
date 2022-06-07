class App {
  constructor() {
    this.buttons = document.getElementById('buttons');
    this.bindEvents();
  }

  bindEvents() {
    this.buttons.addEventListener('click', (e) => {
      let value = e.target.dataset.id;
      if (value === 'createLink') this.createLink(value);
      document.execCommand(value);
      this.toggleButtons(e, value);
    });
  }

  createLink(value) {
    let url = prompt('Please enter the URL to link to:');
    if (!url) return;
    document.execCommand(value, false, url);
  }

  toggleButtons(e, value) {
    if (this.buttonGroups('text').includes(value)) {
      e.target.classList.toggle('pushed');
    } else if (this.buttonGroups('link').includes(value)) {
      return;
    } else if (this.buttonGroups('list').includes(value)) {
      let listButtons = this.getListButtons();
      listButtons.forEach(button => {
        if (!(button.classList.contains('pushed')) && button === e.target) {
          button.classList.add('pushed');
        } else {
          button.classList.remove('pushed');
        }
      });
    } else {
      let justifyButtons = this.getJustifyButtons();
      justifyButtons.forEach(button => button.classList.remove('pushed'));
      e.target.classList.add('pushed');
    }
  }

  getJustifyButtons() {
    let buttons = [];
    this.buttonGroups('justify').forEach(selector => {
      buttons.push(document.querySelector(`[data-id='${selector}']`));
    });
    return buttons;
  }

  getListButtons() {
    let buttons = [];
    this.buttonGroups('list').forEach(selector => {
      buttons.push(document.querySelector(`[data-id='${selector}']`));
    });
    return buttons;
  }

  buttonGroups(key) {
    const groups = {
      text: ['bold', 'italic', 'underline', 'strikeThrough'],
      link: ['createLink'],
      list: ['insertUnorderedList', 'insertOrderedList'],
      justify: ['justifyLeft', 'justifyRight', 'justifyCenter', 'justifyFull'],
    }

    return groups[key];
  }
}

document.addEventListener('DOMContentLoaded', () => new App());
