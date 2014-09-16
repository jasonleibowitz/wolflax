$('.home.about').ready(function(){

  // about page content toggle
  $('#about-button').click(showAbout);
  $('#jordan-button').click(showJordan);
  $('#staff-button').click(showStaff);

  if (window.location.search == "?q=jordan") {
    showJordan();
  } else if (window.location.search == "?q=staff") {
    showStaff();
  }

    $("#owl-demo").owlCarousel({

      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
      autoPlay: true

      // "singleItem:true" is a shortcut for:
      // items : 1,
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false

    });

});

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
