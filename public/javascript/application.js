$(function() {
  var console = $('.console');

  $.getJSON('/challenges').then(function(data) {
    var challenges = data;
    var consoleInput = $('.console-input-field');
    var currentLevel = 0;
    consoleInput.keydown(function(e) {
      if (e.which === 13) {
        var userAnswer = consoleInput.val();
        consoleInput.val('');
        var userAnswerDiv = $('<div>');
        userAnswerDiv.text('> ' + userAnswer);
        userAnswerDiv.insertBefore(consoleInput);
        if (userAnswer === challenges[currentLevel].answer) {
          // if the user's input matches the answer of the current challenge
          var successMessageDiv = $('<div>');
          successMessageDiv.addClass('success').text(challenges[currentLevel].success);
          successMessageDiv.insertBefore(consoleInput);
        } else {
          var failureMessageDiv = $('<div>');
          failureMessageDiv.addClass('fail').text(challenges[currentLevel].fail);
          failureMessageDiv.insertBefore(consoleInput);
        }
      }

    });
    $('.hidden').removeClass('hidden');
  });
});