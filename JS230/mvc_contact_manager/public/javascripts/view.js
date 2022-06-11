class View {
  constructor() {
    this.main = document.getElementById('root');
    this.addContactBtn = document.getElementById('addContactBtn');
    this.noContactsMsg = document.getElementById('noContactsMsg');
    this.searchBar = document.getElementById('searchBar');
    this.addContactForm = this.createElement('form', 'addContactForm');
    this.editContactForm = this.createElement('form', 'editContactForm');
    this.contactsList = this.createElement('div', 'contactsList');
    this.tags = this.createElement('div', 'allTags');
    this.templates = this.createTemplates();
    this.registerPartialsAndHelpers();
    this.bindEvents();
  }

  bindEvents() {
    this.addContactBtn.addEventListener('click', this.showAddContactForm.bind(this));
    this.noContactsMsg.addEventListener('click', this.noContactsMsgClick.bind(this));
    this.addContactForm.addEventListener('keydown', this.checkValidTagEntry.bind(this));
    this.editContactForm.addEventListener('keydown', this.checkValidTagEntry.bind(this));
  }

  bindAddContactCancel(handler) {
    this.addContactForm.addEventListener('click', event => {
      let el = event.target;
      if (el.textContent === 'Cancel' && el.tagName === 'BUTTON') handler();
    });
  }

  bindEditContactCancel(handler) {
    this.editContactForm.addEventListener('click', event => {
      let el = event.target;
      if (el.textContent === 'Cancel' && el.tagName === 'BUTTON') handler();
    })
  }

  bindAddContact(handler) {
    this.addContactForm.addEventListener('submit', event => {
      event.preventDefault();
      handler(this.addContactForm);
    });
  }

  bindContactChange(editHandler, deleteHandler) {
    this.contactsList.addEventListener('click', async(event) => {
      event.preventDefault();
      let target = event.target;

      if (target.tagName !== 'BUTTON') return;
      let id = target.parentElement.dataset.id;
      this.currentId = id;

      if (target.textContent === 'Edit') {
        let contact = await editHandler(id);
        contact['title'] = 'Edit contact';
        let html = this.templates.contactFormTemplate(contact);
        this.editContactForm.textContent = '';
        this.editContactForm.insertAdjacentHTML('afterbegin', html);
        this.showEditContactForm();
      } else {
        deleteHandler(id);
      }
    });
  }

  bindUpdateContact(handler) {
    this.editContactForm.addEventListener('submit', event => {
      event.preventDefault();
      handler(this.editContactForm, this.currentId);
    });
  }

  bindTagSelected(refreshHomepageHandler, filterByTagHandler) {
    this.tags.addEventListener('click', event => {
      let target = event.target;
      this.searchBar.value = '';
      if (target.tagName !== 'INPUT') return;
      let data = new FormData(this.tags.querySelector('form'));
      let selectedTag = data.get('tag');
      selectedTag === 'all' ? refreshHomepageHandler() : filterByTagHandler(selectedTag);
    });
  }

  bindSearchFilter(handler) {
    this.searchBar.addEventListener('keyup', event => {
      let target = event.target;
      let query = target.value.toLowerCase();
      handler(query);
    });
  }

  contactListClick(e) {
    e.preventDefault();
    if (target.tagName !== 'BUTTON') return;
    let id = target.parentElement.dataset.id;
    this.currentId = id;
    target.textContent === 'Edit' ? this.getDataForEditing(id) : this.deleteContact(id);
  }

  createTemplates() {
    let contactFormHtml = document.getElementById('contactFormTemplate').innerHTML;
    let contactListHtml = document.getElementById('contactListTemplate').innerHTML;
    let tagsHtml = document.getElementById('tagsTemplate').innerHTML;
    
    return {
      contactFormTemplate: Handlebars.compile(contactFormHtml),
      contactListTemplate: Handlebars.compile(contactListHtml),
      tagsTemplate: Handlebars.compile(tagsHtml),
    };
  }

  registerPartialsAndHelpers() {
    let singleContactHtml = document.getElementById('singleContactTemplate').innerHTML;
    Handlebars.registerPartial('singleContactTemplate', singleContactHtml);
    Handlebars.registerHelper('spaceOutTags', function(tags) {
      if (tags) return tags.split(',').join(', ');
    });
  }

  createElement(tag, id) {
    let element = document.createElement(tag);
    element.setAttribute('id', id);
    return element;
  }

  showAddContactForm() {
    this.clearHomepage();
    this.tags.remove();
    let html = this.templates.contactFormTemplate({title: 'Create contact'});
    this.addContactForm.textContent = '';
    this.addContactForm.insertAdjacentHTML('afterbegin', html);
    this.main.append(this.addContactForm);
  }

  showEditContactForm() {
    this.clearHomepage();
    this.tags.remove();
    this.main.append(this.editContactForm);
  }

  noContactsMsgClick(e) {
    let target = e.target;
    if (target.tagName !== 'BUTTON') return;
    let clickEvent = new Event('click');
    this.addContactBtn.dispatchEvent(clickEvent);
  }

  loadHomepage(contacts, tagsLoaded, allContacts) {
    this.clearHomepage();
    let contactsForTags;

    if (allContacts) {
      contactsForTags = allContacts;
    } else {
      contactsForTags = contacts;
    }

    if (!tagsLoaded) this.loadTags(contactsForTags);

    if (contacts.length === 0) {
      this.tags.remove();
      this.main.append(this.noContactsMsg);
    } else {
      let html = this.templates.contactListTemplate({ contacts: contacts });
      this.contactsList.insertAdjacentHTML('afterbegin', html);
      this.main.append(this.contactsList);
    }
  }

  clearHomepage() {
    this.noContactsMsg.remove();
    this.addContactForm.remove();
    this.editContactForm.remove();
    this.contactsList.remove();
    this.contactsList.textContent = '';
  }

  loadTags(contacts) {
    let allTags = [];

    contacts.forEach(({tags}) => {
      if (tags) tags.split(',').forEach(singleTag => {
        if (!allTags.includes(singleTag)) allTags.push(singleTag);
      });
    });

    this.tags.textContent = '';
    let html = this.templates.tagsTemplate({tags: allTags});
    this.tags.insertAdjacentHTML('afterbegin', html);
    this.main.append(this.tags);
  }

  checkValidTagEntry(e) {
    let target = e.target;
    let lastChar = target.value.slice(-1);
    if (target.id !== 'tags') return;
    let key = e.key.toLowerCase();
    if (key.match(/[^a-z,]/)) {
      e.preventDefault();
    } else if (key.match(',') && (lastChar === ',' || lastChar === '')) {
      e.preventDefault();
    }
  }
}

export default new View();
