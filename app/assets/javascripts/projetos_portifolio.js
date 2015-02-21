$(function(){
  
  projects_grid();
});


function projects_grid(){
  
  if($('.l-projetos') && $('.l-projetos').length > 0){
        
    $('#grid').hGrid({
  
      boxWidth:304,
      boxMargin:1,
      gItem:'article'
    });     
  }
}

function search_portfolio_projects(){

  $.ajax({

    url     : $('form').attr('action'),
    type    : $('form').attr('method'),
    dataType: 'script',
    data    : $('form').serialize(),
    success : function( data ) {

      projects_grid();
    },
    error   : function( xhr, err ) {
      
      Console.log(err);    
    }
  });
}