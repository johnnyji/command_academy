$(function() {
  var $console = $('.console');

  $console.on('click', function(e){
    $console.find('input').focus();
  });

  $.getJSON('/challenges').then(function(data) {
    var challenges = data;
    var challengeInstructions = $('.challenge-instructions');
    var challengeTitle = $('.challenge-title');
    var challengeAnswer = $('.challenge-answer');
    var consoleInput = $('.console-input-field');
    var consoleInputWrapper = $('.console-input-wrapper');
    var currentLevel = 0;

    var populateInitialFields = function() {
      var initialChallenge = challenges[0];
      challengeInstructions.text(initialChallenge.instructions);
      challengeTitle.text(initialChallenge.answer);
      challengeAnswer.text(initialChallenge.answer);
    };

    populateInitialFields();

    var postConsoleResponse = function(currentLevel, inputField) {
      if (currentLevel.console_text !== '') {
        var consoleResponseDiv = $('<div>');
        consoleResponseDiv.addClass('console-response').text(currentLevel.console_text);
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
      return userInputDiv.insertBefore(inputField);
    }

    var finished = function() {
      var winningMessage = "Amazing job! You now have the ability to perform the basic UNIX commands it takes in order to make and find any directory on your computer!\n\nThere's no excuse to ever make a folder by manually clicking the desktop ever again!";
      challengeInstructions.text(winningMessage);
    };

    var nextChallenge = function(level) {
      var currentChallenge = challenges[level];
      if (currentChallenge === challenges.last) {
        finished();
      } else {
        challengeInstructions.text(currentChallenge.instructions);
        challengeTitle.text(currentChallenge.answer);
        challengeAnswer.text(currentChallenge.answer);
      }
    };

    // var initialCommand = function() {
    //   status = true;
    //   var readyToBegin = consoleInput.keydown(function(e) {
    //     var userInput = consoleInput.val();
    //     if (e.which === 13 && userInput === 'begin') {
    //       postUserInput(userInput, consoleInputWrapper);
    //       postResult('Hooray! Let\'s begin!', 'success', consoleInputWrapper);
    //       return true;
    //       // have it exit out of the entire initial command function
    //     } else if (e.which === 13) {
    //       consoleInput.val('');
    //       postUserInput(userInput, consoleInputWrapper);
    //       postResult('WrongCommandError: Try entering "begin" into the console', 'fail', consoleInputWrapper);
    //       readyToBegin();
    //     }
    //   });
    //   if (readyToBegin) { status = false };
    //   return status
    // };

    var beginChallenges = function() {
      $console.on("keydown", function(e){
        if (e.which === 13) {
          var userAnswer = $.trim(consoleInput.val());
          postUserInput(userAnswer, consoleInputWrapper);
          if (userAnswer === challenges[currentLevel].answer) {
            var successMessageDiv = $('<div>');
            postConsoleResponse(challenges[currentLevel], consoleInputWrapper);
            postResult(challenges[currentLevel].success, 'success', consoleInputWrapper);
            currentLevel ++;
            nextChallenge(currentLevel);
          } else if (userAnswer === 'clear') {
            $console.html('<div class="console-input-wrapper">$<input class="console-input-field" autofocus></input></div>');
            consoleInput = $('.console-input-field');
            consoleInputWrapper = $('.console-input-wrapper');
            consoleInput.focus();
          } else {
            postResult(challenges[currentLevel].fail, 'fail', consoleInputWrapper);
          }
        }
      });
    };
    $('.hidden').removeClass('hidden'); //this only shows the page when all JSON data has been loaded
    beginChallenges(); 
  });
});