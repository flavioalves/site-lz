$(function(){
  
  if($('.l-projetos') && $('.l-projetos').length > 0){
    /*
    $('.masonry.js-masonry').masonry({
      itemSelector: '.item',
      // set columnWidth a fraction of the container width
      columnWidth: function( containerWidth ) {
        return containerWidth / 3;
      }
    });
    */

        
    $('#grid').hGrid({
      boxWidth:304,
      boxMargin:1,
      gItem:'article'
    });
    
  
  }
});