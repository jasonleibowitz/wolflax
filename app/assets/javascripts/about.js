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

  // Staff Profile Picture Logic
  $('#lawson').mouseenter(lawsonToggle);
  $('#lawson').mouseleave(lawsonToggle);

  $('#manley').mouseenter(manleyToggle);
  $('#manley').mouseleave(manleyToggle);

  $('#offit').mouseenter(offitToggle);
  $('#offit').mouseleave(offitToggle);

    $("#owl-demo").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
      autoPlay: true
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

function lawsonToggle(){
  if ($(this).css('margin-left') === '-270px'){
    $(this).css('margin-left', 0);
    $(this).css('width', '400px');
  } else {
    $(this).css('margin-left', '-270px');
    $(this).css('width', '500px');
  }
}

function manleyToggle(){
  if ($(this).css('margin-left') === '-290px'){
    $(this).css('margin-left', '-20px');
  } else {
    $(this).css('margin-left', '-290px');
  }
}

function offitToggle(){
  if ($(this).css('margin-left') === '-250px'){
    $(this).css('margin-left', 0);
    $(this).css('width', '400px');
    $(this).css('margin-top', 0);
  } else {
    $(this).css('margin-left', '-250px');
    $(this).css('width', '450px');
    $(this).css('margin-top', '-30px');
  }
}
