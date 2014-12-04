$(function(){

  $("#site-menu").mmenu({
      classes     : 'mm-white',
      searchfield   : true,
      counters    : true,
      header      : {
        add   : true,
        update  : true,
        title : 'mmenu'
      }
    },{
      offCanvas: {
        pageNodetype: "section.page"
      }
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
