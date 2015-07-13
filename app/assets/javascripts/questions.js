$(function () {
  // $('#a').submit(function () {
  //   $(this).votes_a += 1;
  // });
$('.edit_question input[type=submit]').click(function () {
  $(this).parent('form').submit();
});
});
