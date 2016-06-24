$(function(){
  $('.start-essay-button').click(function(){
    document.getElementById("essay-submission-field").disabled = false;
    document.getElementById("essay-submission-field").focus();

  });
});
