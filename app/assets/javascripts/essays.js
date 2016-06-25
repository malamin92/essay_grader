$(function(){
  $('.start-essay-button').click(function(){
    document.getElementById("essay-submission-field").disabled = false;
    document.getElementById("essay-submission-field").focus();
    $('#timer-disclaimer').slideUp();
    var setTime = new Date(); 
    setTime.setMinutes(setTime.getMinutes() + 30);
    //setTime.setSeconds(setTime.getSeconds() + 10);
    $('#countdown-timer').countdown('option', {until: setTime}); 
  });

  $('#countdown-timer').countdown(
      {format: 'MS',
        onExpiry: submitEssay});

});

function submitEssay(){
  $('#new_essay').submit();
}
