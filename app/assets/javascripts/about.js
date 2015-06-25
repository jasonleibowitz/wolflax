$('.home.about').ready(function(){

    $("#owl-demo").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
      autoPlay: true,
      autoHeight: true
    });

  // about page content toggle
  // $('#about-button').click(showAbout);
  // $('#jordan-button').click(showJordan);
  // $('#staff-button').click(showStaff);

  // if (window.location.search == "?q=jordan") {
  //   showJordan();
  // } else if (window.location.search == "?q=staff") {
  //   showStaff();
  // }

  $(".testimonial-slider").slick({
      dots: true,
      adaptiveHeight: true,
  });

});

// function showAbout(){
//   $('#jordan').css('display', 'none');
//   $('#staff').css('display', 'none');
//   $('#about').css('display', 'block');
// }

// function showJordan(){
//   $('#about').css('display', 'none');
//   $('#staff').css('display', 'none');
//   $('#jordan').css('display', 'block');
// }

// function showStaff(){
//   $('#about').css('display', 'none');
//   $('#jordan').css('display', 'none');
//   $('#staff').css('display', 'block');
// }

// function offitToggle(){
//   if ($(this).css('margin-left') === '-250px'){
//     $(this).css('margin-left', 0);
//     $(this).css('width', '400px');
//     $(this).css('margin-top', 0);
//   } else {
//     $(this).css('margin-left', '-250px');
//     $(this).css('width', '450px');
//     $(this).css('margin-top', '-30px');
//   }
// }
