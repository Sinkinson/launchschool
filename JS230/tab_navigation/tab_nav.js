$(function() {
  $('a').on('click', function(e) {
    $('article').hide().filter('[data-block=' + $(this).attr('data-block') + ']').show();
  });
});
