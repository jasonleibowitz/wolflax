$(window).bind("load", function() {
  console.log('loaded bro');

   var footerHeight = 0;
       footerTop = 0;
       $footer = $(".footer");
  msieversion();
  positionFooter();


   $(window)
           .scroll(positionFooter)
           .resize(positionFooter);

});

function positionFooter() {

  footerHeight = $footer.height();
  footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";

 if ( ($('.content-wrap').height()+footerHeight) < $(window).height()) {
     $footer.css({
          position: "absolute",
          bottom: 0
     });
 } else {
     $footer.css({
          position: "static"
     });
 }

}

function msieversion() {

        var ua = window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");

        if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer, return version number
            // alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
          alert('You are currently using Internet Explorer version ' + parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))) + '. This website requires IE version 10 or higher. Please upgrade or user another browser.');
        else                 // If another browser, return 0
            // alert('otherbrowser');

   return false;
}
