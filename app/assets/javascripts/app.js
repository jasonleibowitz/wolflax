$(window).bind("load", function() {
  // console.log('loaded bro');

   var footerHeight = 0;
       footerTop = 0;
       $footer = $(".footer");

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
