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
