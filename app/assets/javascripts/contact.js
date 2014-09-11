$('.home.contact').ready(function(){

  // Contact Page Icon Animations
  $('#map-icon').mouseenter(shrink);
  $('#map-icon').mouseleave(unShrink);

  $('#phone-icon').mouseenter(shrink);
  $('#phone-icon').mouseleave(unShrink);

  $('#email-icon').mouseenter(shrink);
  $('#email-icon').mouseleave(unShrink);

});

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
