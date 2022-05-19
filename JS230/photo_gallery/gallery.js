document.addEventListener('DOMContentLoaded', function() {
  let thumbnails = document.querySelectorAll('ul li > img');
  let mainImage = document.querySelector('figure > img');

  thumbnails.forEach(thumbnail => {
    thumbnail.addEventListener('click', function(e) {
      thumbnails.forEach(thumbnail => thumbnail.classList.remove('active'));
      this.classList.add('active');
      mainImage.src = this.src;
    });
  });
});
