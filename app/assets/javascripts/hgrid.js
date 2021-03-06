(function($){

jQuery.fn.hGrid = function(options){  

  

  //Seta os valores padrões do grid
  var defaults = {
    boxWidth:300,
    boxMargin:2,
    gItem:'li'
  }

  //Define a lista de opções padrões
  var options =  jQuery.extend(defaults, options); 

  //Esse codigo eh sempre nessesario em qualquer plugin
  return this.each(function(){
    var timer;

    //Pega os itens que estao dentro do elemento selecionado ( grid )      
    var item_children = jQuery(this).find(options.gItem); 

    //Conta quantos itens existem 
    var arraySize = item_children.size(); 

    //Atribui a variavel colunas a quantidade de colunas existentes
    var colunas = Math.floor(jQuery(this).width()/(options.boxWidth + options.boxMargin)); 

    //lista Itens Primaria que sera subtraida
    var lista = new Array(); 
    
    //Essta lista nao sera modificada
    var listaOriginal = new Array(); 

    //Nova lista para incremento da lista modificada
    var listb = new Array(); 

    var x = 0;

    while ( x < arraySize ){

      //Cria a lista Original
      listaOriginal[x] = new Array(toString(x));
      listaOriginal[x]['tamanho'] = parseInt(item_children.eq(x).attr('data-block'));
      listaOriginal[x]['classes'] = item_children.eq(x).attr('class');
      listaOriginal[x]['imagem'] = item_children.eq(x).html();       

      //Cria a lista para modificacao
      lista[x] = new Array(toString(x));
      lista[x]['tamanho'] = parseInt(item_children.eq(x).attr('data-block'));
      lista[x]['classes'] = item_children.eq(x).attr('class');
      lista[x]['imagem'] = item_children.eq(x).html();

      console.log(x);
      x++;
    }
    
    //Limpa o html com os itens feitos pelo usuario
    jQuery(this).html(''); 

  
    //soma para incremento
    var soma = 0; 
    
    //Teste da soma para saber se vai ser maior, menor ou igual a coluna
    var testesoma; 

    //Variavel de teste para saber se existe proximos itens que cabe na linha
    var hood=0; 

    //incremento para lista nova
    var a = 0; 

    //loop da lista
    var g = 0; 

    //veriffica se a lista esta vazia, enquanto a lista nao estiver vazia ela continua executando os testes
    while ( lista.length != 0 ){ 
      //Faz o teste da soma
      testesoma = soma + lista[g]['tamanho'];

      //Primeiro verifica se o teste de soma vai ser menor que a quantidade de colunas
      if ( testesoma < colunas ){
        //Sendo verdadeiro ele insere o valor na lista de incremento
        listb[a] = new Array(toString(a));
        listb[a]['tamanho'] = lista[g]['tamanho'];
        listb[a]['classes'] = lista[g]['classes'];
        listb[a]['imagem'] = lista[g]['imagem']; 

        //Faz a soma 
        soma = soma + lista[g]['tamanho']; 

        //Deleta da lista de modificação
        lista.splice(g,1); 

        //Adiciona +1 a lista de incremento
        a = a + 1; 

        //Volta ao indice da lista de modificacao
        g = 0; 

        hood = 0; //Zera a variavel de teste

      //Verifica se o teste da soma e igual a coluna
      }
      else if( testesoma == colunas ){

        //Sendo verdadeiro, ainda continua a inserir os itens
        listb[a] = new Array(toString(a));
        listb[a]['tamanho'] = lista[g]['tamanho'];
        listb[a]['classes'] = lista[g]['classes'];
        listb[a]['imagem'] = lista[g]['imagem'];
        soma = soma + lista[g]['tamanho']; //Faz a soma

        //Deleta da lista de modificação
        lista.splice(g,1); 

        //A soma eh zerada pois chegou ao limite de colunas
        soma = 0; 

        //Adiciona +1 a lista de incremento
        a = a + 1; 

        //Volta ao indice do loop da lista
        g = 0; 
        //Zera a variavel de teste
        hood = 0;

      //Verifica se o teste da soma e maior, se for maior ele vai pular o item e fazer uma nova verificacao

      }else if( testesoma > colunas ){

        hood++; //Adiciona a variavel de teste +1
        g=g+1; //Adiciona +1 ao loop da lista

        //Verifica se a variavel de teste e igual o tamanho da lista

        if ( hood >= lista.length ){
          //Caso verdadeira 

          g=0; //Volta ao indice do loop da lista

          //E coloca o item na linha, pois nao ha mais nenhum item para encaixar. ( final de lista )

          listb[a] = new Array(toString(a));
          listb[a]['tamanho'] = lista[g]['tamanho'];
          console.log(listb[a]['tamanho'] + ' - ' + lista[g]['tamanho'] );
          listb[a]['classes'] = lista[g]['classes'];
          listb[a]['imagem'] = lista[g]['imagem'];
          lista.splice(g,1); //Deleta o item da lista de modificacao
          a=a+1; //Adiciona +1 a lista do loop da lista
        }
      }
    }

    //reinsere o conteudo atraves de um loop  
    var y = 0; //Variavel do loop
    while ( y < arraySize ){
      jQuery(this).append('<article class="'+listb[y]['classes']+'" data-block="'+ listb[y]['tamanho'] +'" >'+ listb[y]['imagem'] +'</article>');//Faz um append no documento grid
    y++;}
    
    //lista.clear();
    //listb.clear();

    

    // tenho que pegar novamente os valores para poder reescreve-los
    var item_children1 = jQuery(this).find(options.gItem); //atribui um elemento a uma variavel
    var arraySize = item_children.size(); //Atribui a quantidade de itens a uma variavel
    var wWidth = jQuery(window).width(); //Define a largura do documento
    var wHeight = jQuery(window).height(); //Define a altura do documento
    var colum, diff, hRation, wSingleItem; //Cria algumas variaveis para manipulacao
    var numberItens = 0; //Zera o contador do numero de itens
    var obj = jQuery(this);

    //Caso o usuario faca um resize na tela
    function resize(item_children){

      //Cria uma variavel com o numero de colunas
      colum = Math.floor(jQuery(obj).width()/(options.boxWidth + options.boxMargin));

      //Cria uma variavel com a diferenca do grid
      jQuery(obj).width('auto');
      var widthObj = jQuery(obj).width();
      jQuery(obj).width(jQuery(obj).width());
      diff = jQuery(obj).width() - (colum *(options.boxWidth + options.boxMargin));

      //Calcula a largura do item
      wSingleItem = options.boxWidth + (diff / colum);

      //Calcula a proporcao da altura
      hRation = wSingleItem / options.boxWidth;

      //Faz a verificacao para saber se o item eh de largura de 2 blocos ou 1 bloco
      jQuery(item_children).each(function(){

        if(jQuery(this).attr('data-block') == '1'){ //Caso verdade do item ser de 1 bloco 
          numberItens += 1; //Adiciona a variavel de numero de itens +1 ( 1 coluna )
          jQuery(this).css({ //Atribui margem e largura no item para ele ficar proporcionalmente igual
            'width':wSingleItem,
            'height':options.boxWidth * hRation,
            'margin-right':options.boxMargin,
            'margin-bottom':options.boxMargin
          });

          

        } else if(jQuery(this).attr('data-block') == '2'){ //Caso o item tenha 2 blocos de largura 
          //Calcula a proporcao da largura do item
          var wItem1x2 = (options.boxWidth * 2 + ((diff / colum) * 2)) + options.boxMargin; 
          var hItem1x2 = options.boxWidth * hRation;
          numberItens += 2; //Adiciona a variavel de numero de itens +2 ( 2 colunas )

          // verifica se é mobile - apenas uma coluna
          if(colum == 1){
            wItem1x2 = options.boxWidth + (diff / colum);
            hItem1x2 = wItem1x2 / 2
          } 
          
          jQuery(this).css({ //Atribui margem e largura no item para ele ficar proporcionalmente igual
            'width':wItem1x2,
            'height':hItem1x2,
            'margin-right':options.boxMargin,
            'margin-bottom':options.boxMargin
          });
        }
      })
      
      
      //BUG NO IFONE!!! RESOLVER
      if (navigator.userAgent.match(/iPhone/i)){
        
      }else{
        item_children.hide();
        //Faz o fade nas imagens na hora em que monta
        function fadeIn(idx){
          item_children.eq(idx).fadeIn(200, function(){
            fadeIn(jQuery(this).index()+1);
          });
        }

        clearTimeout(timer);

        timer = setTimeout(function(){
          fadeIn(0);
        },1000);
      }

    }

    resize(item_children1); //Efetua o resize quando carrega

    });
};
})(jQuery);