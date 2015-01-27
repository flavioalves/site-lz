$(document).ready(function(){

  $("#site-menu").mmenu({
      classes     : 'mm-white',
      counters    : true,
      offCanvas : {
        position: "right"
      }
    },{
      offCanvas: {
        pageNodetype: "section.page"
      }
    });  

  $("#site-menu-bar").mmenu({
      classes     : 'mm-white',
      counters    : true,
      offCanvas : {
        position: "right"
      }
    },{
      offCanvas: {
        pageNodetype: "section.page"
      }
  });

  // controll header
  $("#header").headroom({
    offset : 200,
    tolerance : 5,
  });
  
  var offset = 10;
  var heightToTop = $(window).scrollTop();
  if(heightToTop < offset){
    $('.header-top-container').fadeIn( "slow" );  
  }

  // var lastScrollTop = 0;
  // $(window).scroll(function(event){
  //    var st = $(this).scrollTop();
  //    var isHeaderBarOpen = false;
  //    var isHeaderTopOpen = false;

  //    if (st > lastScrollTop && st > offset){
  //       $('.header-top-container').fadeOut( "slow", function(){
  //         $(this).hide();
  //       });  
  //    } else {
  //       // upscroll code
  //       if(st <= offset){
  //         $('.header-bar-container').fadeOut( "slow", function(){
  //           $(this).hide();
  //         }); 

  //         $('.header-top-container').fadeOut( "slow", function(){
  //           $(this).show();
  //         });

  //       } else {
  //         $('.header-bar-container').fadeIn( "slow", function(){
  //           $(this).show();
  //         }); 
  //       }
  //    }
  //    lastScrollTop = st;
  // });  

  

  
});
