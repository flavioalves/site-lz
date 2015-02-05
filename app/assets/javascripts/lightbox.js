jQuery(document).ready(function($){

if($('.projgrid').length > 0){
  $(window).resize(function(){

    //Faz o calculo dos tamanhos das imagens
    //Adiciona a imagem dentro do lightbox para exibi-lo  
    $('.lightbox .boxContent').width($(window).width() - 60);
    $('.lightbox .boxContent').height($(window).height() - 60); 

    var img = $('.lightbox .boxContent img')
    var alturaImg = img.height();
    var larguraImg = img.width();

    alturaTela = $(window).height() - 60;
    larguraTela = $(window).width() - 60;
      
    if ( alturaImg > larguraImg ){
        
      var newHeightImg = alturaTela;
      var newWidthImg = ( newHeightImg * larguraImg ) / alturaImg;
      img.css({'margin-left': '-' + newWidthImg / 2 + 'px'});
      img.css({'margin-top': '-' + newHeightImg / 2 + 'px', 'top':'50%'});
      img.css({'width': newWidthImg});
      img.css({'height': newHeightImg});  
        
    } else {
      var newWidthImg = larguraTela;
      var newHeightImg = ( newWidthImg * alturaImg ) / larguraImg;
      
      if ( newHeightImg > alturaTela ){
        var newHeightImg = alturaTela;
        var newWidthImg = ( newHeightImg * larguraImg ) / alturaImg;
      }
      
      img.css({'margin-left': '-' + newWidthImg / 2 + 'px'});
      img.css({'margin-top': '-' + newHeightImg / 2 + 'px', 'top':'50%'});
      img.css({'width': newWidthImg });
      img.css({'height': newHeightImg }); 
    }
    var topButtons = ( $(window).height() - 94 ) / 2;
    $('a.lbNextBtn, a.lbBackBtn').css({'top': topButtons});

  });

  

  $('article.item a').on('click',function(){
    url = $(this).find('img').attr('src').replace('styles/1x2/public/','').replace('styles/1x1/public/','');
    //calcula a quantidade de itens
    var totalItens = $(this).parent().parent().find('article').size();

    //Pega a posicao atual
    var atualPosition = $(this).parent().index();

    //calcula o botao anterior
    var previousPosition;
    if( atualPosition == 0) { previousPosition = totalItens-1; } else { previousPosition = atualPosition - 1; }
    $('a.lbBackBtn').attr('rel',previousPosition);

    //calcula o proximo botao
    var nextPosition;
    if( atualPosition == ( totalItens - 1 )) { nextPosition = 0; } else { nextPosition = atualPosition + 1; }
    $('a.lbNextBtn').attr('rel',nextPosition);

    //Posiciona os botoes de acordo com a altura
    var topButtons = ( $(window).height() - 94 ) / 2;
    $('a.lbNextBtn, a.lbBackBtn').css({'top': topButtons});

    //Adiciona a imagem dentro do lightbox para exibi-lo  
    $('.lightbox .boxContent').width($(window).width() - 60);
    $('.lightbox .boxContent').height($(window).height() - 60);

    $('.lightbox .boxContent img').fadeOut(300,function(){
        $(this).remove();
      });
    
    //Objeto com imagem

    $('<img src="'+url+'" />').load(function(){

      //Faz o resize
      var imgCount = $('.lightbox .boxContent img').size();

      //Insere mais 1 imagem    
      $('.lightbox .boxContent').append($(this));

      //Esconte o item
      $(this).css({'visibility':'hidden'});
      $(this).css({'opacity':'0','visibility':'visible'}).animate({'opacity':1},400)

      //Faz o calculo dos tamanhos das imagens  
      var alturaImg = $(this).height();
      var larguraImg = $(this).width();
      
      alturaTela = $(window).height() - 60;
      larguraTela = $(window).width() - 60;
      
      if ( alturaImg > larguraImg ){
          
        var newHeightImg = alturaTela;
        var newWidthImg = ( newHeightImg * larguraImg ) / alturaImg;
        $(this).css({'margin-top': '-' + newHeightImg / 2 + 'px', 'top':'50%'});
        $(this).css({'margin-left': '-' + newWidthImg / 2 + 'px'});
        $(this).css({'width': newWidthImg});
        $(this).css({'height': newHeightImg});
        
        //alert('altura tela: ' + alturaTela + ' Altura imagem: '+ newHeightImg );
        //alert('Largura tela: ' + larguraTela + ' Largura imagem: '+ newWidthImg );
          
      }else{
        
        var newWidthImg = larguraTela;
        var newHeightImg = ( newWidthImg * alturaImg ) / larguraImg;
        
        if ( newHeightImg > alturaTela ){
          
          var newHeightImg = alturaTela;
          var newWidthImg = ( newHeightImg * larguraImg ) / alturaImg;
          
        }
        
        
        $(this).css({'margin-left': '-' + newWidthImg / 2 + 'px'});
        $(this).css({'margin-top': '-' + newHeightImg / 2 + 'px', 'top':'50%'});
        $(this).css({'width': newWidthImg});
        $(this).css({'height': newHeightImg});  
        
        //alert('altura tela: ' + alturaTela + ' Altura imagem: '+ newHeightImg );
        //alert('Largura tela: ' + larguraTela + ' Largura imagem: '+ newWidthImg );
        
      }
      //FIM NEW

    });



    $('.lightbox').fadeIn();



    return false;

  });

  

  $('a.lbNextBtn').on('click',function(){
    $('article.item').eq($(this).attr('rel')).find('a').click();
  });

  $('a.lbBackBtn').on('click',function(){
    $('article.item').eq($(this).attr('rel')).find('a').click();
  });


  $('a.lbCloseBtn').on('click',function(){
    $('.lightbox').fadeOut(300,function(){
      $(this).find('.boxContent').html();
    });
  });
  
  //Animacoes dos botoes
  /*
  $('.lightbox a').mouseover(function(){
    $(this).stop().animate({'width':'90px'}, 300);
  }).mouseout(function(){
    $(this).stop().animate({'width':'34px'}, 300); 
  });
  */

}
});