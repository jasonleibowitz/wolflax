$(document).ready(function(){
  console.log('loaded bro!');

  fixHeight();
  $(window).resize(fixHeight);

});

function fixHeight(){
  var heroHeight = $('.hero-img-wrap').height();
  var padding = heroHeight + 10;
  $('.content').css('margin-top', padding + 'px');
}
