class App {
  constructor() {
    this.addContactBtn = document.getElementById('add_contact_btn');
    this.noContactsBox = document.getElementById('no_contacts_box');
    this.contactsList = this.createContainer('contacts_list');
    this.searchBar = document.getElementById('searchBar');
    this.tags = this.createContainer('allTags');
    this.main = document.querySelector('main');
    this.createTemplates();
    this.buildForms();
    this.bindEvents();
    this.loadHomepage();
  }

  bindEvents() {
    this.bindAddContactFormEvents();
    this.bindEditContactFormEvents();
    this.bindContactFilteringEvents();
    this.bindInterfaceChangeEvents();
  }

  bindAddContactFormEvents() {
    this.addContactForm.addEventListener('submit', this.addContact.bind(this));
    this.addContactForm.addEventListener('click', this.handleFormClick.bind(this));
    this.addContactForm.addEventListener('keydown', this.checkValidTagEntry.bind(this));
  }

  bindEditContactFormEvents() {
    this.editContactForm.addEventListener('submit', this.updateContact.bind(this));
    this.editContactForm.addEventListener('click', this.handleFormClick.bind(this));
    this.editContactForm.addEventListener('keydown', this.checkValidTagEntry.bind(this));
  }

  bindContactFilteringEvents() {
    this.tags.addEventListener('click', this.tagClick.bind(this));
    this.searchBar.addEventListener('keyup', this.handleSearch.bind(this));    
  }

  bindInterfaceChangeEvents() {
    this.addContactBtn.addEventListener('click', this.showAddContactForm.bind(this));
    this.noContactsBox.addEventListener('click', this.noContactsBoxClick.bind(this));
    this.contactsList.addEventListener('click', this.contactListClick.bind(this));
  }

  createContainer(idString) {
    let container = document.createElement('div');
    container.setAttribute('id', idString);
    return container;
  }

  createTemplates() {
    let contactFormHtml = document.getElementById('contact_form_template').innerHTML;
    this.contactFormTemplate = Handlebars.compile(contactFormHtml);
    let contactListHtml = document.getElementById('contacts_list_template').innerHTML;
    this.contactListTemplate = Handlebars.compile(contactListHtml);
    let singleContactHtml = document.getElementById('single_contact_template').innerHTML;
    Handlebars.registerPartial('single_contact_template', singleContactHtml);
    let tagHtml = document.getElementById('tags_template').innerHTML;
    this.tagsTemplate = Handlebars.compile(tagHtml);
    Handlebars.registerHelper('spaceOutTags', (tag) => tag.split(',').join(', '));
  }

  buildForms() {
    this.addContactForm = this.buildAddContactForm();
    this.editContactForm = this.buildEditContactForm();
  }

  buildAddContactForm() {
    let html = this.contactFormTemplate({title: 'Create contact'});
    let form = document.createElement('form');
    form.setAttribute('id', 'add_contact_form');
    form.insertAdjacentHTML('afterbegin', html);
    return form;
  }

  buildEditContactForm() {
    let form = document.createElement('form');
    form.setAttribute('id', 'edit_contact_form');
    return form;
  }

  handleFormClick(e) {
    let el = e.target;
    if (el.textContent === 'Cancel' && el.tagName === 'BUTTON') this.loadHomepage();
  }

  showAddContactForm() {
    this.resetHomepage();
    this.addContactForm.reset();
    this.tags.remove();
    this.main.append(this.addContactForm);
  }

  showEditContactForm() {
    this.resetHomepage();
    this.tags.remove();
    this.main.append(this.editContactForm);
  }

  updateContact(e) {
    e.preventDefault();
    let data = new FormData(this.editContactForm);
    let json = this.convertToJson(data);
    let request = new XMLHttpRequest();
    request.open('PUT', `/api/contacts/${this.currentId}`);
    request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    request.send(json);
    request.addEventListener('load', () => this.loadHomepage());
  }

  addContact(e) {
    e.preventDefault();
    let data = new FormData(this.addContactForm);
    let json = this.convertToJson(data);
    let request = new XMLHttpRequest();
    request.open('POST', '/api/contacts/');
    request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    request.send(json);
    request.addEventListener('load', () => this.loadHomepage());
  }

  contactListClick(e) {
    e.preventDefault();
    let target = e.target;
    if (target.tagName !== 'BUTTON') return;
    let id = target.parentElement.dataset.id;
    this.currentId = id;
    target.textContent === 'Edit' ? this.getDataForEditing(id) : this.deleteContact(id);
  }

  async getDataForEditing(id) {
    let contactData = await fetch(`/api/contacts/${id}`);
    let contact = await contactData.json();
    contact['title'] = 'Edit contact';
    let html = this.contactFormTemplate(contact);
    this.editContactForm.textContent = '';
    this.editContactForm.insertAdjacentHTML('afterbegin', html);
    this.showEditContactForm();
  }

  deleteContact(id) {
    let request = new XMLHttpRequest();
    if (!(confirm('Are you sure you want to delete this contact?'))) return;
    request.open('DELETE', `/api/contacts/${id}`);
    request.send();
    request.addEventListener('load', () => this.loadHomepage());
  }

  noContactsBoxClick(e) {
    let target = e.target;
    if (target.tagName !== 'BUTTON') return;
    let clickEvent = new Event('click');
    this.addContactBtn.dispatchEvent(clickEvent);
  }

  convertToJson(data) {
    let obj = {};
    for (let pair of data) { obj[pair[0]] = pair[1] };
    return JSON.stringify(obj);
  }

  resetHomepage() {
    this.noContactsBox.remove();
    this.addContactForm.remove();
    this.editContactForm.remove();
    this.contactsList.remove();
    this.contactsList.textContent = '';
  }

  async loadHomepage(contacts, tagsLoaded) {
    let allContacts = await this.getAllContacts();
    contacts = contacts || allContacts;
    
    this.resetHomepage();
    if (!tagsLoaded) this.loadTags(allContacts);

    if (contacts.length === 0) {
      this.main.append(this.noContactsBox);
      this.tags.remove();
    } else {
      let html = this.contactListTemplate({ contacts: contacts });
      this.contactsList.insertAdjacentHTML('afterbegin', html);
      this.main.append(this.contactsList);
    }
  }

  tagClick(e) {
    let target = e.target;
    this.searchBar.value = '';
    if (target.tagName !== 'INPUT') return;
    let data = new FormData(this.tags.querySelector('form'));
    let selectedTag = data.get('tag');
    selectedTag === 'all' ? this.loadHomepage(null, true) : this.filterContacts(selectedTag);
  }

  async filterContacts(tag) {
    let contacts = await this.getAllContacts();
    let filteredContacts = contacts.filter(({tags}) => tags.includes(tag));
    this.loadHomepage(filteredContacts, true);
  }

  loadTags(contacts) {
    let allTags = [];
    contacts.forEach(({tags}) => {
      if (tags) tags.split(',').forEach(singleTag => {
        if (!allTags.includes(singleTag)) allTags.push(singleTag);
      });
    });

    this.tags.textContent = '';
    let html = this.tagsTemplate({tags: allTags});
    this.tags.insertAdjacentHTML('afterbegin', html);
    this.main.append(this.tags);
  }

  async getAllContacts() {
    let contacts_data = await fetch('/api/contacts');
    let contacts = await contacts_data.json();
    return contacts;
  }

  async handleSearch(e) {
    let target = e.target;
    let query = target.value.toLowerCase();
    let contacts = await this.getAllContacts();
    let filtered = contacts.filter(({full_name}) => full_name.toLowerCase().startsWith(query));
    this.loadHomepage(filtered);
  }

  checkValidTagEntry(e) {
    let target = e.target;
    if (target.id !== 'tags') return;
    let key = e.key.toLowerCase();
    if (key.match(/[^a-z,]/)) e.preventDefault();
  }
}

document.addEventListener('DOMContentLoaded', () => new App());
