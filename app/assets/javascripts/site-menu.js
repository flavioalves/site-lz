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



  $('.main-menu li').click(function(e){
    $('.main-menu').find('li.active').removeClass('active');
    $(e.currentTarget).addClass('active');    
  });
  
  //set menu location
  var pathArray = window.location.pathname.split( '/' );
  var path = pathArray[1];

  var menuItens = $('.main-menu li');
  $(menuItens).each(function(){
    //clean old selection
    $(this).removeClass('active');

    if(path && path.length > 1){
      if($(this).find('a').attr('href') == "/" + path){
        $(this).addClass('active');        
      }
    } else {
      //is in home page remove yellow bord on footer. improve it.      
      $("#footer").addClass("yellow-border");
    }
  });  
  
});
