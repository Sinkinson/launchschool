class toolTipApp {
  constructor() {
    this.images = Array.from(document.querySelectorAll('img'));
    this.tooltip = document.getElementById('tooltip-div');
    this.abortId = null;
    this.bindEvents();
  }

  bindEvents() {
    this.images.forEach(image => {
      image.addEventListener('mouseenter', this.showTooltip.bind(this));
      image.addEventListener('mouseleave', this.hideTooltip.bind(this));
    });
  }

  showTooltip(event) {
    let targetImg = event.target;
    let data = targetImg.dataset.tooltip;
    let imgPosition = targetImg.getBoundingClientRect();
    this.abortId = setTimeout(() => {
      this.tooltip.innerHTML = data;
      this.tooltip.hidden = false;
      this.tooltip.style.top = imgPosition.bottom + 'px';
      this.tooltip.style.left = imgPosition.left + 'px';
    }, 2000);
  }

  hideTooltip() {
    clearInterval(this.abortId);
    this.tooltip.hidden = true;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new toolTipApp();
});
