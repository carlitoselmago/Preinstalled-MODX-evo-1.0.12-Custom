$(document).ready(function(){

	$("#subcabecera_cats a").click(function(e) {
		e.preventDefault();
		$("#subcabecera_cats a").removeClass('active_cat');
		$(this).addClass('active_cat');
	});
	
	$('#postcont img:last').load(function(){
		
		var $listado_fotos=$("#postcont");
		var activeClass=$("#postcont").attr("class");
		
		//$listado_fotos.masonry();
		
		var arr=new Array();
		arr.push($('#postcont .item.'+activeClass).siblings().not('.'+activeClass));
		
		$('#postcont .item.'+activeClass).siblings().not('.'+activeClass).css({transform:' scale(0.001) '});
		$('#postcont .item.'+activeClass).siblings().not('.'+activeClass).fadeTo(0, 0);
		//$listado_fotos.masonry('hide',arr);
		$listado_fotos.masonry();
		
		centrarCont();

		$("#subcabecera_cats a").click(function(e) {
			e.preventDefault();
			var activeClass=$(this).attr("categoria");
			
			$('#postcont .item').css({transform:' scale(1) '});
			$('#postcont .item').fadeTo(0, 1);
			$('#postcont .item.'+activeClass).siblings().not('.'+activeClass).css({transform:' scale(0.001) '});
			$('#postcont .item.'+activeClass).siblings().not('.'+activeClass).fadeTo(0, 0);
			$listado_fotos.masonry();
			centrarCont();
			
			var arr=new Array();
			arr.push($('#postcont .item.'+activeClass).siblings().not('.'+activeClass));
			//$listado_fotos.masonry('hide',arr).masonry();
			
		});
		
		$(window).resize(function () { centrarCont(); });
	
	});
	
	function centrarCont(){
		var maximoancho=Math.max.apply(Math,$('#cont #postcont img').map(function(){
		   return $(this).width();
		}).get());
		
		var maximomargen=Math.max.apply(Math,$('#cont #postcont .item').map(function(){
			//console.log(parseInt($(this)[0].style.left'245px', 10));
			return parseInt( $(this)[0].style.left, 10 );
		   
		}).get());
		var paddingitems=12;
		console.log(paddingitems);
		var anchocontenedor=maximoancho+maximomargen+(paddingitems*2);
		$("#postcont").width(anchocontenedor);
		
	}
	
	function multiBrowserCSS(param,values){
		var prefixes=['-moz-','-webkit-','-ms-',''];
		var outputString="";
		
		for (m=0;m<prefixes.length;m++){

				outputString+=prefixes[m]+param+' '+values+' ';

		}
		return outputString;
	}
	
});//FINAL DOCUMENT READY