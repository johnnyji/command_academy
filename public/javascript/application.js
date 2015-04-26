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
    var asciiBox = $('.ascii');
    var currentChallenge = challenges[0];
    var userInputList = [];
    var lastUserInputIndex = 0;
    var lastChallenge = challenges[challenges.length - 1];

    var populateInitialFields = function() {
      var initialChallenge = challenges[0];
      challengeInstructions.text(initialChallenge.instructions);
      challengeTitle.text(initialChallenge.answer);
      challengeAnswer.text(initialChallenge.answer);
      asciiBox.text(initialChallenge.ascii);
    };

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
      $console.scrollTop($console.get(0).scrollHeight);
      return userInputDiv.insertBefore(inputField);
    }

    var injectFinishedInfo = function() {
      var winningMessage = "Amazing job! You now have the ability to perform the basic UNIX commands it takes in order to make and find any directory on your computer!\n\nThere's no excuse to ever make a folder by manually clicking the desktop ever again!\n\n Type 'next' into the console.";
      var winningTitle = "Congratulations!";
      var winningAnswer = "next";
      var errorMessage = "Wrong, type 'next' to continue!";
      // var lastAscii = "
      // desktop
      // .
      // |-- $ project
      //     .
      //     |-- index.html
      //     |-- ruby
      //     |-- css
      //     |-- js
      //     |";
      // asciiBox.text(lastAscii);
      challengeInstructions.text(winningMessage);
      challengeTitle.text(winningTitle);
      challengeAnswer.text(winningAnswer);
    };


    var nextChallenge = function(currentChallenge) {
      // this will return undefined if next challenge doesn't exist
      return challenges[challenges.indexOf(currentChallenge) + 1];
    }

    var injectChallengeInfo = function(nextChallenge) {
      challengeInstructions.text(nextChallenge.instructions);
      challengeTitle.text(nextChallenge.answer);
      challengeAnswer.text(nextChallenge.answer);
      asciiBox.text(nextChallenge.ascii);
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

    var userIsAtLastChallenge = function(challenge) {
      return (challenges.indexOf(challenge) === (challenges.length - 1));
    }

    var triggerConsoleResponse = function(userInput) {
      switch(userInput) {
        case currentChallenge.answer:
          currentChallenge.finished = true;
          postConsoleResponse(currentChallenge, consoleInputWrapper);
          postResult(currentChallenge.success, 'success', consoleInputWrapper);
          if (userIsAtLastChallenge(currentChallenge)) {
            injectFinishedInfo();
          } else {
            currentChallenge = nextChallenge(currentChallenge);
            injectChallengeInfo(currentChallenge);
          }
          break;
        case 'clear':
          clearConsole();
          break;
        case 'next':
          if (currentChallenge.finished) {
            window.location.href = '/finished';
          } else {
            postResult(currentChallenge.fail, 'fail', consoleInputWrapper);
          }
          break;
        default:
          postResult(currentChallenge.fail, 'fail', consoleInputWrapper);
      }
    }

    var beginChallenges = function() {
      $console.on("keydown", function(e){
        if (e.which === enterKey) {
          var userInput = $.trim(consoleInput.val());
          lastUserInputIndex = 0;
          postUserInput(userInput, consoleInputWrapper);
          triggerConsoleResponse(userInput);
        } else if (e.which === upKey || e.which === downKey) {
          retrievePreviousInput(e.which);
        }
      });
    };

    var setupEnvironment = function() {
      populateInitialFields();
      $('.hidden').removeClass('hidden');
      beginChallenges();
    }

    // EXECUTE APP
    setupEnvironment();
    consoleInput.on('blur', function() {
      $(this).focus();
    });

  });
});