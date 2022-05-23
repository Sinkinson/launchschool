document.addEventListener('DOMContentLoaded', function() {
  const templates = {};
  let photos;

  function getTemplates() {
    let tempElements = document.querySelectorAll("script[type='text/x-handlebars");
    tempElements.forEach(template => {
      templates[template["id"]] = Handlebars.compile(template.innerHTML);
    });
  }

  function createPartials() {
    let partialElements = document.querySelectorAll("[data-type=partial]");
    partialElements.forEach(template => {
      Handlebars.registerPartial(template["id"], template.innerHTML);
    });
  }

  async function renderPhotos() {
    let response = await fetch('/photos');
    let json = await response.json();
    photos = json;

    let html = templates.photos({ photos: photos });
    let slides = document.querySelector('#slides');
    slides.insertAdjacentHTML('beforeend', html);
    renderPhotoInfo(photos[0]);
    getPhotoCommentsFor(1);
    slideshow.init();
  }

  function renderPhotoInfo(photo) {
    let html = templates.photo_information(photo);
    let header = document.querySelector('section > header');
    header.innerHTML = html;
  }

  async function getPhotoCommentsFor(id) {
    let comments = await fetch('/comments?photo_id=' + id);
    let json = await comments.json();
    let html = templates.photo_comments({ comments: json });
    let list = document.querySelector('#comments > ul');
    list.innerHTML = html;
  }

  function main() {
    getTemplates();
    createPartials();
    renderPhotos();
  }

  let slideshow = {
    init() {
      this.slideshow = document.querySelector('#slideshow');
      let slides = this.slideshow.querySelectorAll('figure');
      this.firstSlide = slides[0];
      this.lastSlide = slides[slides.length - 1];
      this.currentSlide = this.firstSlide;
      this.bind();
    },

    bind() {
      let prevButton = this.slideshow.querySelector('a.prev');
      let nextButton = this.slideshow.querySelector('a.next');
      prevButton.addEventListener('click', (e) => { this.prevSlide(e) });
      nextButton.addEventListener('click', (e) => { this.nextSlide(e) });
    },

    prevSlide(e) {
      e.preventDefault();
      let prev = this.currentSlide.previousElementSibling;
      if (!prev) prev = this.lastSlide;
      this.fadeOut(this.currentSlide);
      this.fadeIn(prev);
      this.renderPhotoContent(prev.dataset.id);
      this.currentSlide = prev;
    },

    nextSlide(e) {
      e.preventDefault();
      let next = this.currentSlide.nextElementSibling;
      if (!next) next = this.firstSlide;
      this.fadeOut(this.currentSlide);
      this.fadeIn(next);
      this.renderPhotoContent(next.dataset.id);
      this.currentSlide = next;
    },

    fadeOut(slide) {
      slide.classList.add('hide');
      slide.classList.remove('show');
    },

    fadeIn(slide) {
      slide.classList.remove('hide');
      slide.classList.add('show');
    },

    renderPhotoContent(id) {
      renderPhotoInfo(photos[+(id) - 1]);
      getPhotoCommentsFor(id);
    },
  }

  main();

  document.querySelector("section > header").addEventListener("click", function(e) {
    e.preventDefault();
    let button = e.target;
    let buttonType = button.getAttribute("data-property");
    if (buttonType) {
      let href = button.getAttribute('href');
      let dataId = button.getAttribute('data-id');
      let text = button.textContent;

      fetch(href, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: 'photo_id=' + dataId
      })
      .then(response => response.json())
      .then(json => button.textContent = text.replace(/\d+/, json.total));
    }
  });

  document.querySelector("form").addEventListener("submit", function(e) {
    e.preventDefault();
    let href = this.action;
    let method = this.method;
    let data = new FormData(this);
    let currentSlideId = slideshow.currentSlide.getAttribute('data-id');
    data.set('photo_id', currentSlideId);

    fetch(href, {
      method: method,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      },
      body: new URLSearchParams([...data])
    })
    .then(response => response.json())
    .then(json => {
      let commentList = document.querySelector('#comments > ul');
      let html = templates.photo_comment(json);
      commentList.insertAdjacentHTML('beforeend', html);
      this.reset();
    });
  });
});
