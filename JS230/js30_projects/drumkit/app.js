class App {
  constructor() {
    this.keys = document.querySelectorAll('.key');
    this.bindEvents();
  }

  bindEvents() {
    window.addEventListener('keydown', this.handleKeyDown.bind(this));
    this.keys.forEach(key => key.addEventListener('transitionend', this.removeTransition));
  }

  handleKeyDown(e) {
    let key = e.key.toUpperCase();
    if (key.match(/[^asdfghjkl]/i)) return;
    let charCode = String(key.charCodeAt());
    let [keyElement, audioElement] = document.querySelectorAll(`[data-key='${charCode}']`);

    keyElement.classList.add('playing');
    this.playSound(audioElement);
  }

  playSound(audioElement) {
    audioElement.currentTime = 0;
    audioElement.play();
  }

  removeTransition(e) {
    e.target.classList.remove('playing');
  }
}

document.addEventListener('DOMContentLoaded', () => new App());
