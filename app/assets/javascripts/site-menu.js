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
  
});
