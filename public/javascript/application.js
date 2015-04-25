$(function() {
  var $console = $('.console');

  $.getJSON('/challenges').then(function(data) {
    var enterKey = 13;
    var upKey = 38;
    var downKey = 40;
    var challenges = data;
    var challengeInstructions = $('.challenge-instructions');
    var challengeTitle = $('.challenge-title');
    var challengeAnswer = $('.challenge-answer');
    var consoleInput = $('.console-input-field');
    var consoleInputWrapper = $('.console-input-wrapper');
    var currentIndex = 0;
    var userInputList = [];
    var lastUserInputIndex = 0;

    var populateInitialFields = function() {
      var initialChallenge = challenges[0];
      challengeInstructions.text(initialChallenge.instructions);
      challengeTitle.text(initialChallenge.answer);
      challengeAnswer.text(initialChallenge.answer);
    };

    populateInitialFields();

    var postConsoleResponse = function(currentChallenge, inputField) {
      if (currentChallenge.console_text !== '') {
        var consoleResponseDiv = $('<div>');
        consoleResponseDiv.addClass('console-response').text(currentChallenge.console_text);
        return consoleResponseDiv.insertBefore(inputField);
      }
    };

    var postResult = function(resultMessage, resultClass, inputField) {
      var messageDiv = $('<div>');
      messageDiv.addClass(resultClass).text(resultMessage);
      messageDiv.insertBefore(inputField);
      $console.scrollTop($console.get(0).scrollHeight);
      return messageDiv;
    };

    var postUserInput = function(userInput, inputField) {
      consoleInput.val('');
      var userInputDiv = $('<div>');
      userInputDiv.text('> ' + userInput);
      userInputList.unshift(userInput);
      return userInputDiv.insertBefore(inputField);
    }

    var finished = function() {
      var winningMessage = "Amazing job! You now have the ability to perform the basic UNIX commands it takes in order to make and find any directory on your computer!\n\nThere's no excuse to ever make a folder by manually clicking the desktop ever again!\n\n Type 'next' into the console.";
      var winningTitle = "Congratulations!";
      var winningAnswer = "next";
      var errorMessage = "Wrong, type 'next' to continue!"
      challengeInstructions.text(winningMessage);
      challengeTitle.text(winningTitle);
      challengeAnswer.text(winningAnswer);
    };

    var nextChallenge = function(nextChallenge) {
      if (nextChallenge === challenges.last) {
        finished();
      } else {
        challengeInstructions.text(nextChallenge.instructions);
        challengeTitle.text(nextChallenge.answer);
        challengeAnswer.text(nextChallenge.answer);
      }
    };

    var retrievePreviousInput = function(key) {
      var topOfPreviousInputs = (lastUserInputIndex === (userInputList.length - 1))
      var bottomOfPreviousInputs = (lastUserInputIndex === 0)
      if (key === upKey) {
        consoleInput.val(userInputList[lastUserInputIndex]);
        if (!topOfPreviousInputs) { lastUserInputIndex ++; } 
      } else if (key === downKey) {
        consoleInput.val(userInputList[lastUserInputIndex]);
        if (!bottomOfPreviousInputs) { lastUserInputIndex --; }
      }
    };

    var clearConsole = function() {
      $console.html('<div class="console-input-wrapper">$<input class="console-input-field" autofocus></input></div>');
      consoleInput = $('.console-input-field');
      consoleInputWrapper = $('.console-input-wrapper');
      consoleInput.focus();
    }

    var beginChallenges = function() {
      $console.on("keydown", function(e){
        if (e.which === enterKey) {
          lastUserInputIndex = 0;
          var userInput = $.trim(consoleInput.val());
          postUserInput(userInput, consoleInputWrapper);

          switch(userInput) {
            case challenges[currentIndex].answer:
              postConsoleResponse(challenges[currentIndex], consoleInputWrapper);
              postResult(challenges[currentIndex].success, 'success', consoleInputWrapper);
              currentIndex ++;
              nextChallenge(challenges[currentIndex]);
              break;
            case 'clear':
              clearConsole();
              break;
            default:
              postResult(challenges[currentIndex].fail, 'fail', consoleInputWrapper);
          }
          
        } else if (e.which === upKey || e.which === downKey) {
          retrievePreviousInput(e.which);
        }
      });
    };
    $('.hidden').removeClass('hidden'); //this only shows the page when all JSON data has been loaded
    beginChallenges();

    consoleInput.on('blur', function() {
      $(this).focus();
    });
  });
});