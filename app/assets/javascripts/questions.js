$(function () {

  $('.edit_question input[type=submit]').click(function () {
    $(this).parent('form').submit();
  });
});
