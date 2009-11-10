$(document).ready(function() {
  $('.toggler').click(function() {
    $(this).toggleClass("down").parent('.description').find('.more').toggle();
    return false;
  });
});
