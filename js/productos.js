$(document).ready(function(){
	
	$(".buy").click(function(e) {
		 e.preventDefault();
	});
	
	$("#subcabecera_cats a").click(function(e) {
		e.preventDefault();
		$("#subcabecera_cats a").removeClass('active_cat');
		$(this).addClass('active_cat');
	});
	
	$('#postcont img:last').load(function(){
		
		var $listado_fotos=$("#postcont");
		var activeClass=$("#postcont").attr("class");
		
		
		
		var arr=new Array();
		arr.push($('#postcont .prod.'+activeClass).siblings().not('.'+activeClass));
		
		$('#postcont .prod.'+activeClass).siblings().not('.'+activeClass).css({transform:' scale(0.001) '});
		$('#postcont .prod.'+activeClass).siblings().not('.'+activeClass).fadeTo(0, 0);

		
	

		$("#subcabecera_cats a").click(function(e) {
			e.preventDefault();
			var activeClass=$(this).attr("categoria");
			
			$('#postcont .prod').css({transform:' scale(1) '});
			setTimeout(function() {
				$('#postcont .prod').show();
			}, 400);
			
			
			$('#postcont .prod').fadeTo(0, 1);
			$('#postcont .prod.'+activeClass).siblings().not('.'+activeClass).css({transform:' scale(0.001) '});
			$('#postcont .prod.'+activeClass).siblings().not('.'+activeClass).fadeTo(0, 0);
			setTimeout(function() {
				$('#postcont .prod.'+activeClass).siblings().not('.'+activeClass).hide();
			}, 400);
			
			
			var arr=new Array();
			arr.push($('#postcont .prod.'+activeClass).siblings().not('.'+activeClass));
			//$listado_fotos.masonry('hide',arr).masonry();
			
		});
		
	
	
	});
	
	
	
	function multiBrowserCSS(param,values){
		var prefixes=['-moz-','-webkit-','-ms-',''];
		var outputString="";
		
		for (m=0;m<prefixes.length;m++){

				outputString+=prefixes[m]+param+' '+values+' ';

		}
		return outputString;
	}
	
});//FINAL DOCUMENT READY