$(function() {

  $('.index-input-field').on('blur', function() {
    $(this).focus();
  });

  var nudgeElement = function(element) {
    element.addClass('animated shake');
    setTimeout(function() {
      element.removeClass('animated shake');
    }, 1000)
  };

  $('.index-wrapper').keydown(function(e) {
    var beginCommandField = $('.index-input-field');
    var beginCommand = $.trim($('.index-input-field').val());
    var beginInstructions = $('.index-instructions');
    if (e.which === 13) {
      if (beginCommand === 'begin') {
        beginCommandField.val('');
        window.location.href = '/begin';
      } else {
        beginCommandField.val('');
        nudgeElement(beginInstructions);
      }
    }
  });
});