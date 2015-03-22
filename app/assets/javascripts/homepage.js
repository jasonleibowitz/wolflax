$('.home.welcome').ready(function(){
  console.log('on homepage');

  fixHeight();
  $(window).resize(fixHeight);

  // nav bar animation
  navTop = $('.nav-wrap').position().top;
  $(window).scroll(function(){
    var scrolled = $(window).scrollTop();
    if ($("body").width > 945) {
      if (scrolled > navTop){
        $('.nav-wrap').removeClass('fadeIn').addClass('fadeOut');
        $('#navbar-homepage').removeClass('fadeOut').addClass('fadeIn');
      } else if (scrolled < navTop) {
        $('.nav-wrap').removeClass('fadeOut').addClass('fadeIn');
        $('#navbar-homepage').removeClass('fadeIn').addClass('fadeOut');
      }
    }
  });

  // Initialize each countdown clock
  $.each($(".clock"), function(index, value){
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
