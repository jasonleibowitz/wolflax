$(".home.staff").ready(function(){

    $("#owl-demo").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
      autoPlay: true
    });

  // Staff Profile Picture Logic
  $('#stein').mouseenter(steinToggle);
  $('#stein').mouseleave(steinToggle);

  $('#manley').mouseenter(manleyToggle);
  $('#manley').mouseleave(manleyToggle);

});

function steinToggle(){
  if ($(this).css('margin-left') === '-350px'){
    $(this).css('margin-left', '-55px');
    $(this).css('width', '615px');
  } else {
    $(this).css('margin-left', '-350px');
    $(this).css('width', '615px');
  }
}

function manleyToggle(){
  if ($(this).css('margin-left') === '-290px'){
    $(this).css('margin-left', '-20px');
  } else {
    $(this).css('margin-left', '-290px');
  }
}
