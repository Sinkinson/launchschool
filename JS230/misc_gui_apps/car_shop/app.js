const cars = [
  { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];

class Template {
  constructor() {
    this.carListHtml = document.getElementById("carListTemplate").innerHTML;
    this.carHtml = document.getElementById("carTemplate").innerHTML;
    this.selectHtml = document.getElementById("selectTemplate").innerHTML;
    this.optionHtml = document.getElementById("optionTemplate").innerHTML;
  }

  createTemplates() {
    Handlebars.registerPartial('carTemplate', this.carHtml);
    Handlebars.registerPartial('optionTemplate', this.optionHtml);
    return {
      carListTemplate: Handlebars.compile(this.carListHtml),
      selectListTemplate: Handlebars.compile(this.selectHtml),
    }
  }
}

class App {
  constructor() {
    this.templates = new Template().createTemplates();
    this.populateCarList(cars);
    this.createSelectLists();
    this.filterBtn = document.getElementById('filterBtn');
    this.filters = document.querySelectorAll('select');
    this.bindEvents();
  }

  bindEvents() {
    this.filterBtn.addEventListener('click', this.filterCars.bind(this));
  }

  filterCars() {
    let selected = {};
    Array.from(this.filters).forEach(filter => {
      if (filter.value !== 'All') {
        selected[filter.name] = filter.value;
      }
    });

    let filteredCars = cars.filter(car => {
      for (let category in selected) {
        if (car[category] != selected[category]) return false;
      }

      return true;
    });

    document.querySelector('#carList').remove();
    this.populateCarList(filteredCars);
  }

  filterCategories(category) {
    let arr = cars.map(car => car[category]);
    return arr.filter((el, idx) => arr.indexOf(el) === idx);
  }

  populateCarList(cars) {
    let html = this.templates.carListTemplate({cars: cars});
    document.body.insertAdjacentHTML('beforeend', html);
  }

  createSelectLists() {
    this.populateSelectList('year');
    this.populateSelectList('price');
    this.populateSelectList('model');
    this.populateSelectList('make');
  }

  populateSelectList(category) {
    let filtered = this.filterCategories(category);
    let html = this.templates.selectListTemplate({ name: category, options: filtered });
    document.querySelector('h1').insertAdjacentHTML('afterend', html);
  }


}

document.addEventListener('DOMContentLoaded', () => new App());
