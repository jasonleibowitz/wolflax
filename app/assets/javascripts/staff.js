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

  // $('#manley').mouseenter(manleyToggle);
  // $('#manley').mouseleave(manleyToggle);

  // Mobile Responsive DOM Manipulation using enquire.js
  enquire.register("screen and (max-width:992px)", {
    match: function() {
      $(".manley-wrap").prepend($(".manley-profile").eq(0).remove());
      $(".duprey-wrap").prepend($(".duprey-profile").eq(0).remove());
    },

    unmatch: function() {
      $(".manley-wrap").append($(".manley-profile").eq(0).remove());
      $(".duprey-wrap").append($(".duprey-profile").eq(0).remove());
    },
  });

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
