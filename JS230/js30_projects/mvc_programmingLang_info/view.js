class View {
  constructor() {
    this.main = document.getElementById('root');
    this.templates = this.createTemplates();
    this.registerPartials();
  }

  bindAdjustContentLength(handler) {
    this.main.addEventListener('click', e => {
      let target = e.target;
      if (target.tagName !== 'BUTTON') return;
      let btn = target.textContent;
      if (btn === 'Show more') {
        let fullDescription = handler(target.id);
        target.previousElementSibling.textContent = fullDescription;
        target.textContent = 'Show less';
      } else {
        this.showLess(target);
      }
    });
  }

  createTemplates() {
    let languagesHtml = document.getElementById('languagesTemplate').innerHTML;

    return {
      languagesTemplate: Handlebars.compile(languagesHtml),
    }
  }

  registerPartials() {
    let languageHtml = document.getElementById('singleLanguageTemplate').innerHTML;
    Handlebars.registerPartial('singleLanguageTemplate', languageHtml);
  }

  showLess(btn) {
    let paragraph = btn.previousElementSibling;
    paragraph.textContent = paragraph.textContent.slice(0, 120) + '...';
    btn.textContent = 'Show more';
  }

  loadHomepage(languages) {
    let html = this.templates.languagesTemplate({languages: languages});
    this.main.insertAdjacentHTML("afterbegin", html);
  }
}

export default View;
