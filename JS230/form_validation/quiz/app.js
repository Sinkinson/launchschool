const questions = [
  {
    id: 1,
    description: "Who is the author of <cite>The Hitchhiker's Guide to the Galaxy</cite>?",
    options: ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein'],
  },
  {
    id: 2,
    description: 'Which of the following numbers is the answer to Life, the \
                  Universe and Everything?',
    options: ['66', '13', '111', '42'],
  },
  {
    id: 3,
    description: 'What is Pan Galactic Gargle Blaster?',
    options: ['A drink', 'A machine', 'A creature', 'None of the above'],
  },
  {
    id: 4,
    description: 'Which star system does Ford Prefect belong to?',
    options: ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri'],
  },
];

const answerKey = { '1': 'Douglas Adams', '2': '42', '3': 'A drink', '4': 'Betelgeuse' };

class Quiz {
  constructor() {
    this.questions = questions;
    this.correctAnswers = answerKey;
    this.questionTemplate = this.createTemplate();
    this.renderQuestions();
    this.resetBtn = document.getElementById('resetBtn');
    this.form = document.getElementById('questions');
    this.msgBoxes = Array.from(document.querySelectorAll("[id^=error_]"));
    this.selectedAnswers = null;
    this.bindEvents();
  }

  bindEvents() {
    this.form.addEventListener('submit', this.handleSubmission.bind(this));
    this.resetBtn.addEventListener('click', this.handleReset.bind(this));
  }

  handleSubmission(e) {
    e.preventDefault();
    this.selectedAnswers = new FormData(this.form);
    this.checkAnswers();
  }

  handleReset(e) {
    e.preventDefault();
    this.form.reset();
    this.selectedAnswers = null;
    this.msgBoxes.forEach(msgBox => {
      msgBox.classList = '';
      msgBox.classList.add('hide');
    });
  }

  checkAnswers() {
    let answerObj = {};
    Array.from(this.selectedAnswers).forEach(pair => answerObj[pair[0]] = pair[1]);

    for (let i = 1; i <= 4; i += 1) {
      if (!(answerObj[String(i)])) answerObj[String(i)] = 'No answer given';
    }

    for (let key in answerObj) {
      let correctAnswer = this.correctAnswers[key];
      let selectedAnswer = answerObj[key];
      let msg = this.msgBoxes[+(key) - 1];

      if (correctAnswer === selectedAnswer) {
        msg.textContent = 'Correct Answer';
        msg.classList.remove('hide');
        msg.classList.add('correct');
      } else if (selectedAnswer === 'No answer given') {
        msg.textContent = `No answer given. Correct answer is ${correctAnswer}`;
        msg.classList.remove('hide');
        msg.classList.add('incorrect');
      } else {
        msg.textContent = `Wrong answer. Correct answer is ${correctAnswer}`;
        msg.classList.remove('hide');
        msg.classList.add('incorrect');
      }
    }
  }

  createTemplate() {
    let questionHtml = document.getElementById('question-template').innerHTML;
    return Handlebars.compile(questionHtml);
  }

  renderQuestions() {
    let html = this.questionTemplate({questions: this.questions});
    document.getElementById('questions').insertAdjacentHTML('beforeend', html);
  }
}

document.addEventListener('DOMContentLoaded', () => new Quiz());
