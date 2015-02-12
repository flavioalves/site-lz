$(document).ready(function(){

  $("#site-menu").mmenu({
      classes     : 'mm-white',
      counters    : true,
      offCanvas : {
        position: "right"
      },
      onClick : {
        close: true
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
      },
      onClick : {
        close: true
      }      
    },{
      offCanvas: {
        pageNodetype: "section.page"
      }
  });

  var headerOffset = ($(".l-login") && $(".l-login").length > 0) ? 10 : 200;
  // controll header
  $("#header").headroom({
    offset : headerOffset,
    tolerance : 5,
  });
  
  var offset = 10;
  var heightToTop = $(window).scrollTop();
  if(heightToTop < offset){
    $('.header-top-container').fadeIn( "slow" );  
  }

});
