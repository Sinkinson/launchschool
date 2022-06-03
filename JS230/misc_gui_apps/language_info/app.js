class app {
  constructor() {
    this.languageDiv = document.querySelector('#languages');
    this.btn = null;
    this.paragraph = null;
    this.bindEvents();
  }

  bindEvents() {
    this.languageDiv.addEventListener('click', this.adjustParagraph.bind(this));
  }

  adjustParagraph(e) {
    if (e.target.tagName === 'BUTTON') {
      this.btn = e.target;
      this.paragraph = document.getElementById(this.btn.value);
      this.paragraph.classList.contains('hide') ? this.showMore() : this.showLess();
    }
  }

  showMore() {
    this.paragraph.classList.replace('hide', 'show');
    this.btn.textContent = 'Show less';
  }

  showLess() {
    this.paragraph.classList.replace('show', 'hide');
    this.btn.textContent = 'Show more';
  }
}

document.addEventListener('DOMContentLoaded', () => new app());
