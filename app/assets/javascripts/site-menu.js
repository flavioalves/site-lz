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

  // controll header
  var myHeader = document.querySelector("header");
  var headroom  = new Headroom(myHeader);
  headroom.init({
    offset : 200,
    tolerance : 200,
  }); 


  $('.header-container').fadeIn( "slow" );  
});
