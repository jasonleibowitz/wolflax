$('home.faq').ready(function(){

  // faq animation logic
  $('.faq-question').click(function(){
    var num = $(this).data('num');
    if ($('#answer-' + num).css('display') === 'none'){
      $('#answer-' + num).slideDown();
    } else {
      $('#answer-' + num).slideUp();
    }
  });

  // binds collapse to any faq answer, so if clicked, that answer will collapse
  $('.answer').click(function(){
    $(this).slideUp();
  });

});
