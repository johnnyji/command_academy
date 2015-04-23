$(function() {
  var console = $('.console');

  $.getJSON('/challenges').then(function(data) {
    var challenges = data;
    var consoleInput = $('.console-input-field');
    var consoleInputWrapper = $('.console-input-wrapper');
    var currentLevel = 0;

    var nextChallenge = function(level) {
      var currentChallenge = challenges[level];
      $('.challenge-instructions').text(currentChallenge.instructions);
      $('.challenge-title').text(currentChallenge.answer);
      $('.challenge-answer').text(currentChallenge.answer);
    };

    consoleInput.keydown(function(e) {
      if (e.which === 13) {
        var userAnswer = consoleInput.val();
        consoleInput.val('');
        var userAnswerDiv = $('<div>');
        userAnswerDiv.text('> ' + userAnswer);
        userAnswerDiv.insertBefore(consoleInputWrapper);
        if (userAnswer === challenges[currentLevel].answer) {
          // if the user's input matches the answer of the current challenge
          var successMessageDiv = $('<div>');
          successMessageDiv.addClass('success').text(challenges[currentLevel].success);
          successMessageDiv.insertBefore(consoleInputWrapper);
          currentLevel ++;
          nextChallenge(currentLevel);
        } else {
          var failureMessageDiv = $('<div>');
          failureMessageDiv.addClass('fail').text(challenges[currentLevel].fail);
          failureMessageDiv.insertBefore(consoleInputWrapper);
        }
      }

    });
    $('.hidden').removeClass('hidden');
  });
});