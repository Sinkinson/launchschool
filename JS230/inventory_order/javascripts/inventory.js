document.addEventListener('DOMContentLoaded', function() {
  let itemTempEl = document.querySelector('#inventory_item');
  let itemTable = document.querySelector('#inventory');
  let addBtn = document.querySelector('#add_item');

  class InventoryManager {
    constructor() {
      this.lastId = 0;
      this.collection = [];
      this.itemTemplate = Handlebars.compile(itemTempEl.innerHTML);
    }

    setDate() {
      let date = new Date();
      let dateElement = document.querySelector('#order_date');
      dateElement.textContent = date.toUTCString();
    }

    add(e) {
      this.lastId += 1;

      let item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1,
      };
      
      this.collection.push(item);
      return item;
    }

    addItem(e) {
      e.preventDefault();
      let item = this.add(e);
      let html = this.itemTemplate(item).trim();
      let placeholder = document.createElement('table');
      placeholder.innerHTML = html;
      let row = placeholder.querySelector('tr');
      itemTable.appendChild(row);
    }

    remove(id) {
      this.collection = this.collection.filter(item => item.id !== id);
    }

    deleteItem(e) {
      e.preventDefault();
      if (e.target.tagName !== 'A') return;
      let itemRow = this.findParent(e);
      itemRow.parentNode.removeChild(itemRow);
      this.remove(this.findID(itemRow));
    }

    findParent(e) {
      return e.target.closest('tr');
    }

    findID(itemRow) {
      return +(itemRow.id);
    }

    get(itemID) {
      return this.collection.find(({id}) => id === itemID);
    }

    update(itemRow) {
      let itemID = this.findID(itemRow);
      let item = this.get(itemID);

      item.name = itemRow.querySelector("[name=item_name]").value;
      item.stock_number = +itemRow.querySelector("[name=item_stock_number]").value;
      item.quantity = +itemRow.querySelector("[name=item_quantity]").value;
    }

    updateItem(e) {
      let itemRow = this.findParent(e);
      this.update(itemRow);
    }

    bindEvents() {
      addBtn.addEventListener('click', inventory.addItem.bind(this));
      itemTable.addEventListener('click', inventory.deleteItem.bind(this));
      itemTable.addEventListener('focusout', inventory.updateItem.bind(this));
    }
  }

  let inventory = new InventoryManager();
  inventory.setDate();
  inventory.bindEvents();
});
