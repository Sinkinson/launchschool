class Model {
  constructor() {}

  bindContactListChanged(callback) {
    this.onContactListChanged = async() => {
      let contacts = await this.getContacts();
      callback(contacts);
    }
  }

  bindLoadHomepage(callback) {
    this.loadHomepage = callback;
  }

  async getContacts() {
    let contacts_data = await fetch('/api/contacts');
    let contacts = await contacts_data.json();
    return contacts;
  }

  add(contact) {
    let data = new FormData(contact);
    let json = this.convertToJson(data);
    let request = new XMLHttpRequest();
    request.open('POST', '/api/contacts');
    request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    request.send(json);
    request.addEventListener('load', this.onContactListChanged);
  }

  async edit(id) {
    let contactData = await fetch(`api/contacts/${id}`);
    let contact = await contactData.json();
    return contact;
  }

  delete(id) {
    let request = new XMLHttpRequest();
    if (!(confirm('Are you sure you want to delete this contact?'))) return;
    request.open('DELETE', `api/contacts/${id}`);
    request.send();
    request.addEventListener('load', this.onContactListChanged);
  }

  update(contact, id) {
    let data = new FormData(contact);
    let json = this.convertToJson(data);
    let request = new XMLHttpRequest();
    request.open('PUT', `api/contacts/${id}`);
    request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    request.send(json);
    request.addEventListener('load', this.onContactListChanged);
  }

  async filterByTag(tag) {
    let contacts = await this.getContacts();
    let filteredContacts = contacts.filter(({tags}) => {
      if (!tags) return false;
      return tags.includes(tag);
    });
    this.loadHomepage(filteredContacts, true, contacts);
  }

  async filterBySearch(query) {
    let contacts = await this.getContacts();
    let filtered = contacts.filter(({full_name}) => full_name.toLowerCase().startsWith(query));
    this.loadHomepage(filtered);
  }

  convertToJson(data) {
    let obj = {};
    for (let pair of data) { obj[pair[0]] = pair[1] };
    return JSON.stringify(obj);
  }
}

export default new Model();
