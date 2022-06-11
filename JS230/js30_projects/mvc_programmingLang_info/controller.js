import View from './view.js';
import Model from './model.js';

class Controller {
  constructor() {
    this.model = new Model();
    this.view = new View();
    this.loadPage();
    this.bindEvents();
  }

  bindEvents() {
    this.view.bindAdjustContentLength(this.showMore);
  }

  loadPage = () => {
    let languages = this.model.getShortDescriptions();
    this.view.loadHomepage(languages);
  }

  showMore = (langName) => this.model.getFullDescription(langName);
}

document.addEventListener('DOMContentLoaded', () => new Controller());
