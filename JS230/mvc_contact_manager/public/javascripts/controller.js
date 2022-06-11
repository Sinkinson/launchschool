import model from './model.js';
import view from './view.js';
import debounce from './debounce.js';

class Controller {
  constructor() {
    this.view = view;
    this.model = model;
    this.bindEvents();
    this.refreshHomepage();
  }

  bindEvents() {
    this.model.bindContactListChanged(this.onChange);
    this.model.bindLoadHomepage(this.onChange);
    this.view.bindAddContactCancel(this.refreshHomepage);
    this.view.bindAddContact(this.addContact);
    this.view.bindContactChange(this.editContact, this.deleteContact);
    this.view.bindUpdateContact(this.updateContact);
    this.view.bindEditContactCancel(this.refreshHomepage);
    this.view.bindTagSelected(this.refreshHomepage, this.filterContactsByTag);
    this.view.bindSearchFilter(this.filterBySearchQuery);
  }

  onChange = (contacts, tagsLoaded, allContacts) => this.view.loadHomepage(contacts, tagsLoaded, allContacts);

  addContact = (contact) => this.model.add(contact);

  editContact = (id) => this.model.edit(id);

  deleteContact = (id) => this.model.delete(id);

  updateContact = (contact, id) => this.model.update(contact, id);

  filterContactsByTag = (tag) => this.model.filterByTag(tag);

  filterBySearchQuery = debounce((query) => this.model.filterBySearch(query), 300);

  refreshHomepage = async(tagsLoaded) => {
    let contacts = await this.model.getContacts(); 
    this.view.loadHomepage(contacts, tagsLoaded);
  }
}

document.addEventListener('DOMContentLoaded', new Controller());
