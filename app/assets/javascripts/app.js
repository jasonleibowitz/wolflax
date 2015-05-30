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

// function msieversion() {

//         var ua = window.navigator.userAgent;
//         var msie = ua.indexOf("MSIE ");

//         if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:10\./))      // If Internet Explorer, return version number
//           versionNumber = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)));
//           if (versionNumber < 10){
//             alert('You are currently using Internet Explorer version ' + versionNumber + '. This website requires IE version 10 or higher. Please upgrade or use another browser.');
//           }
//         else                 // If another browser, return 0
//             // alert('otherbrowser');

//    return false;
// }

function msieversion() {

  var ua = window.navigator.userAgent;
  var msie = ua.indexOf("MSIE ");

  if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer, return version number
    if (parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))) < 10) {
      alert('You are current using Internet Explorer version ' + parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))) + '. This website requires IE 10 or higher. Please upgrade or use another browser.');
    }
  // If another browser, return 0
  // else
    // alert('otherbrowser');

  return false;
}

var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
