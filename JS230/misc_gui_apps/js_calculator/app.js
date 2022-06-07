class Calculator {
  constructor() {
    this.operationWindow = document.getElementById('operation-window');
    this.entryWindow = document.getElementById('entry-window');
    this.buttons = document.getElementById('buttons');
    this.numbers = [];
    this.previousOperator = null;
    this.answerDisplayed = false;
    this.bindEvents();
  }

  bindEvents() {
    this.buttons.addEventListener('click', this.handleClick.bind(this));
  }

  operations() {
    return {
      '/': (num1, num2) => num1 / num2,
      'x': (num1, num2) => num1 * num2,
      '-': (num1, num2) => num1 - num2,
      '+': (num1, num2) => num1 + num2,
      '%': (num1, num2) => num1 % num2,
    }
  }

  handleClick(e) {
    let value = e.target.textContent;
    if (value.match(/\d/)) {
      this.handleDigit(value);
    } else if (value.match(/[-x+/%]/)) {
      this.handleOperation(value);
    } else if (value === '=') {
      this.displayResult();
    } else {
      this.handleOther(value);
    }
  }

  handleDigit(value) {
    let ewValue = this.entryWindow.textContent;
    let lastResult = this.numbers[0];

    if (ewValue === '0' || this.answerDisplayed || ewValue === lastResult) {
      this.entryWindow.textContent = value;
      this.answerDisplayed = false;
    } else {
      this.entryWindow.textContent += value;
    }
  }

  getCurrentEntry() {
    return parseFloat(this.entryWindow.textContent, 10);
  }

  handleOperation(value) {
    let currentValue = this.getCurrentEntry();
    this.numbers.push(currentValue);

    if (this.numbers.length === 2) {
      let func = this.operations()[this.previousOperator];
      let result = func(this.numbers[0], this.numbers[1]);
      this.numbers = [result];
    }

    let displayStr = String(currentValue) + ' ' + value + ' ';
    this.operationWindow.textContent += displayStr;
    this.entryWindow.textContent = this.numbers[0];
    this.previousOperator = value;
    this.answerDisplayed = true;
  }

  handleOther(value) {
    if (value === '.') {
      this.addDecimalPoint();
    } else if (value === 'C') {
      this.clearAllWindows();
    } else if (value === 'CE') {
      this.clearEntryWindow();
    } else {
      this.makeEntryNegative();
    }
  }

  makeEntryNegative() {
    let value = String(this.getCurrentEntry());
    if (value === '0' || value.match(/\-/)) return;
    this.entryWindow.textContent = '-' + value;
  }

  clearEntryWindow() {
    this.entryWindow.textContent = '0';
  }

  clearOperationWindow() {
    this.operationWindow.textContent = '';
  }

  clearAllWindows() {
    this.clearEntryWindow();
    this.clearOperationWindow();
    this.numbers = [];
  }

  addDecimalPoint() {
    this.entryWindow.textContent += '.';
  }

  displayResult() {
    let currentValue = this.getCurrentEntry();
    let func = this.operations()[this.previousOperator];
    let result = func(this.numbers[0], currentValue);
    this.entryWindow.textContent = String(result);
    this.clearOperationWindow();
    this.answerDisplayed = true;
    this.numbers = [];
  }
}

document.addEventListener('DOMContentLoaded', new Calculator());
