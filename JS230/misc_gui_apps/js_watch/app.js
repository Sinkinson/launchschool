class StopWatch {
  constructor() {
    this.startstopBtn = document.getElementById('startstop');
    this.resetBtn = document.getElementById('reset');
    this.allTimers = Array.from(document.querySelectorAll('li'));
    this.centi = document.getElementById('centiseconds');
    this.seconds = document.getElementById('seconds');
    this.minutes = document.getElementById('minutes');
    this.hours = document.getElementById('hours');
    this.centId = null;
    this.bindEvents();
    this.reset();
  }

  bindEvents() {
    this.startstopBtn.addEventListener('click', this.handleStartStop.bind(this));
    this.resetBtn.addEventListener('click', this.reset.bind(this));
  }

  handleStartStop() {
    let value = this.startstopBtn.textContent;
    value === 'Start' ? this.start() : this.stop();
  }

  reset() {
    this.stop();
    this.allTimers.forEach(timer => timer.textContent = '00');
  }

  start() {
    this.centId = setInterval(this.centCounter.bind(this), 10);
    this.startstopBtn.textContent = 'Stop';
  }

  stop() {
    this.startstopBtn.textContent = 'Start';
    clearInterval(this.centId);
  }

  incrementTimerByOne(element) {
    let value = parseInt(element.textContent, 10);
    value += 1;
    element.textContent = String(value).padStart(2, '0');
  }

  centCounter() {
    this.incrementTimerByOne(this.centi);
    let centValue = parseInt(this.centi.textContent, 10);

    if (centValue === 100) {
      this.incrementTimerByOne(this.seconds);
      this.centi.textContent = '00';
    }

    let secValue = parseInt(this.seconds.textContent, 10);
    if (secValue === 60) {
      this.incrementTimerByOne(this.minutes);
      this.seconds.textContent = '00';
    }
        
    let minValue = parseInt(this.minutes.textContent, 10);
    if (minValue === 60) {
      this.incrementTimerByOne(this.hours);
      this.minutes.textContent = '00';
    }
  }
}

document.addEventListener('DOMContentLoaded', new StopWatch());
