class GroceryList {
  constructor(listSelector) {
    this.list = document.querySelector(listSelector)
  }

  addItem(name, quantity) {
    let li = document.createElement('li');
    li.textContent = `${quantity} ${name}`;
    this.list.append(li);
  }
}

document.addEventListener('DOMContentLoaded', function() {
  let form = document.querySelector('form');
  let list = new GroceryList('#list');

  form.addEventListener('submit', function(e) {
    e.preventDefault();
    let getValueOf = (selector) => form.querySelector(selector).value;

    let name = getValueOf('#name');
    let quantity = getValueOf('#quantity') || 1;
    list.addItem(name, quantity);
    form.reset();
  });
});
