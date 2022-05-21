document.addEventListener('DOMContentLoaded', function() {
  const message = document.querySelector('#message');
  const letters = document.querySelector('#spaces');
  const guesses = document.querySelector('#guesses');
  const apples = document.querySelector('#apples');
  const replay = document.querySelector('#replay');
  let handleKeyPress;
  
  var randomWord = function() {
    var words = ['apple', 'banana', 'orange', 'pear'];
  
    return function() {
      var word = words[Math.floor(Math.random() * words.length)];
      words.splice(words.indexOf(word), 1);
      return word;
    };
  }();

  class Game {
    constructor() {
      this.incorrect = 0;
      this.lettersGuessed = [];
      this.correctSpaces = 0;
      if (!this.chooseWord()) return this;
      this.init();
    }

    chooseWord() {
      this.word = randomWord();
      if (!this.word) {
        this.displayMessage("Sorry, I've run out of words!");
        return false;
      } else {
        this.word = this.word.split("");
        return this;
      }
    }

    createBlanks() {
      this.removeSpans(letters);
      this.addSpans();
      this.spaces = document.querySelectorAll("#spaces span");
    }

    addSpans() {
      for (let i = 0; i < this.word.length; i += 1) {
        spaces.appendChild(document.createElement('span'));
      }
    }

    removeSpans(element) {
      let spans = element.querySelectorAll('span');
      spans.forEach(span => span.parentNode.removeChild(span));
    }

    displayMessage(text) {
      message.textContent = text;
    }

    init() {
      this.createBlanks();
    }

    keyAlphabetic(key) {
      return (/\b[a-z]\b/).test(key);
    }

    handleKeyPress(e) {
      let key = e.key.toLowerCase();
      if (!(this.keyAlphabetic(key))) return;
      if (this.lettersGuessed.includes(key)) return;
      this.lettersGuessed.push(key);
      this.showGuess(key);

      if (this.word.includes(key)) {
        this.fillSpace(key);
      } else {
        this.incorrect += 1;
        apples.classList = '';
        apples.classList.add(`guess_${this.incorrect}`);
      }

      this.checkResult();
    }

    displayResult(outcome) {
      document.body.classList.add(outcome);
      replay.style.display = 'block';
      let msg = outcome === 'win' ? "You win!" : "Sorry! You're out of guesses";
      this.displayMessage(msg);
    }

    checkResult() {
      if (this.correctSpaces === this.word.length) {      
        this.displayResult('win');
        this.unbindKeyPress();
      } else if (this.incorrect > 5) {
        this.displayResult('lose');
        this.unbindKeyPress();
      }
    }

    unbindKeyPress() {
      document.removeEventListener('keyup', handleKeyPress);
    }

    fillSpace(letter) {
      this.spaces.forEach((space, idx) => {
        if (this.word[idx] === letter) {
          this.correctSpaces += 1;
          space.textContent = letter;
        }
      });
    }

    showGuess(letter) {
      let span = document.createElement('span');
      span.textContent = letter;
      guesses.appendChild(span);
    }

    reset() {
      this.removeSpans(guesses);
      replay.style.display = 'none';
      message.textContent = '';
      document.body.classList.value = '';
    }
  }

  let newGame = (() => {
    let game;

    return function() {
      if (game) game.reset();
      game = new Game();
      handleKeyPress = game.handleKeyPress.bind(game);
      document.addEventListener('keyup', handleKeyPress);
    }
  })();

  newGame();
  replay.addEventListener('click', newGame);
});
