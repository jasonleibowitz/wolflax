$('.home.welcome').ready(function(){
  console.log('on homepage');

  fixHeight();
  $(window).resize(fixHeight);

  // nav bar animation
  navTop = $('.nav-wrap').position().top;
  $(window).scroll(function(){
    var scrolled = $(window).scrollTop();
    if (scrolled > navTop){
      $('.nav-wrap').fadeOut();
      $('#navbar-homepage').fadeIn();
    } else if (scrolled < navTop) {
      $('.nav-wrap').fadeIn();
      $('#navbar-homepage').fadeOut();
    }
  });

  // Initialize each countdown clock
  $.each($(".clock"), function(index, value){
    console.log('starting date: ' + $(this).data('start'));
    var starting_date = $(this).data('start');
    $(this).countdown(starting_date, function(event){
      $(this).html(event.strftime("%D days %H hours %M minutes %S seconds"));
    });
  });

});

function fixHeight(){
  var heroHeight = $('.hero-img-wrap').height();
  var padding = heroHeight + 10;
  $('.content').css('margin-top', padding + 'px');
}
