$(document).ready(function(){
  console.log('loaded bro!');

  fixHeight();
  $(window).resize(fixHeight);

  // about page content toggle
  $('#about-button').click(showAbout);
  $('#jordan-button').click(showJordan);
  $('#staff-button').click(showStaff);

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

  // Contact Page Icon Animations
  $('#map-icon').mouseenter(shrink);
  $('#map-icon').mouseleave(unShrink);

  $('#phone-icon').mouseenter(shrink);
  $('#phone-icon').mouseleave(unShrink);

  $('#email-icon').mouseenter(shrink);
  $('#email-icon').mouseleave(unShrink);

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

});

function fixHeight(){
  var heroHeight = $('.hero-img-wrap').height();
  var padding = heroHeight + 10;
  $('.content').css('margin-top', padding + 'px');
}

function showAbout(){
  $('#jordan').css('display', 'none');
  $('#staff').css('display', 'none');
  $('#about').css('display', 'block');
}

function showJordan(){
  $('#about').css('display', 'none');
  $('#staff').css('display', 'none');
  $('#jordan').css('display', 'block');
}

function showStaff(){
  $('#about').css('display', 'none');
  $('#jordan').css('display', 'none');
  $('#staff').css('display', 'block');
}

function shrink(){
  $(this).children(":first").animate({
    width: '50px'
  }, 1000);
}

function unShrink(){
  $(this).children(":first").animate({
    width: '100px'
  }, 1000);
}
