(function($){
return $.fn.threeDbook = function(options) { 

// set up default options 
	var defaults = {
		generalPerspective: 400,
		pagesSimulateFactor:2,
		pagesDefaultAmount:150,
		pagesSimulateSpace:2,
		rotationY:-15,
		rotationZ:0,
		translateZ:0,
		classBlankPage:'blankwhite_page',
		hoverEffect: true,
		easetype:'all 200ms ease',
		perspectiveOrigin: '0% 100%',
		transformOrigin: '0% 0%',
		pageShadow: '1px 1px 3px 1px rgba(1,1,1,0.1)'
	}; 
	
	var options = $.extend({}, defaults, options); 
	
	
	return this.each(function() { 
		
		
		var pages=$(this).attr("pages");
		if (pages === undefined){
			pages=options.pagesDefaultAmount;
		}
		
		//LAUNCH
		construct3dbook(this,pages);
		
		
		//HOVER
		$(this).mouseenter(function(){
			if (options.hoverEffect){
				hover3dbook(this,pages,$(this).attr("hoverfactor"));
			}
		}).mouseleave(function(){
			if (options.hoverEffect){
				unhover3dbook(this,pages);
			}
		});
		
	});
	
	function construct3dbook(e,pagesNum){
		
		var srcCover=$("img",e).attr("src");
		if ($("img",e).attr("width")){
			var CoverW=parseInt(($("img",e).attr("width")).replace("px", ""));
		}
		//var CoverW=$("img",e).attr("width");
		if (CoverW === undefined){
			CoverW = $("img",e).width();
		}
		if ($("img",e).attr("height")){
			var CoverH=parseInt(($("img",e).attr("height")).replace("px", ""));
		}
		
		//var CoverH=$("img",e).attr("height");
		if (CoverH === undefined){
			CoverH = $("img",e).height();
		}

		//padding-left compensation
		//var paddingleftC=CoverW+(CoverW*((Math.abs(options.rotationY))/100));
		//var paddingleftC=CoverW+((CoverW*((Math.abs(options.rotationY))/100))+2);
		//var paddingleftC=CoverW+( ( CoverW * 1.08) );
		
		var pagesSimulated=pagesNum*(bigBooks(options.pagesSimulateFactor)/100);
		
		//var widthTrigonometric= CoverW*(Math.cos(Math.abs(options.rotationY)));
		//var widthTrigonometric=CoverW+( ( CoverW * 1.08) );
		var paddingleftC=Math.abs(CoverW+(pagesSimulated*3));
		//var paddingleftC=( ( CoverW * 1.08) );
		//alert(paddingleftC);
		
		//var paddingleftC= CoverW+12;
		//ample nou = ample vell x coseno 15º
		
		$(e).css("padding-left",paddingleftC+'px');
		$(e).css({'transition': 'all 200ms ease'});
		$(e).css({'perspective':options.generalPerspective+'px'});
		//ISSUE WITH ALIGN FIX
		var alignDirection=$(e).css("text-align");
		
		if (alignDirection.indexOf("left") >= 0) {
			$(e).css({'perspective-origin':'0% 60%'});
		}
		if (alignDirection.indexOf("center") >= 0) {
			$(e).css({'perspective-origin':'50% 60%'});
		}
		if (alignDirection.indexOf("right") >= 0) {
			$(e).css({'perspective-origin':'100% 60%'});
		}
		
		//APLICAMOS CSS A LA PORTADA
		$(e).empty();
		$(e).prepend(construtPage(srcCover,'','cover',CoverW,CoverH,options.rotationY,options.rotationZ,options.translateZ,null,CoverW));
		
		
		
		for(p=0;p<pagesSimulated;p++){
			//CREAMOS PAGINAS BLANCAS
			$(e).prepend(construtPage('img/blank.png','',options.classBlankPage,CoverW-3,CoverH-3,options.rotationY,options.rotationZ,'-'+p*options.pagesSimulateSpace,1,CoverW,options.perspectiveOrigin));
		}
		
		//CUBIERTA DORSO
		$(e).prepend(construtPage(srcCover,'','cover',CoverW,CoverH,options.rotationY,options.rotationZ,options.translateZ-(pagesSimulated*options.pagesSimulateSpace),null,CoverW));
		
	}
	
	//FUNCION CONSTRUIR PÁGINA
	function construtPage(srcImage,idImage,classBlankPage,imageW,imageH,rotationY,rotationZ,translateZ,imageMarginBottom,marginleft,perspectiveOrigin){
		
		return '<img src="'+srcImage+'"  id="'+idImage+'" class="'+classBlankPage+'" style="width:'+imageW+'px; height:'+imageH+'px; margin-bottom:'+imageMarginBottom+'px; margin-left:-'+marginleft+'px; '
		+multiBrowserCSS('transform:','rotatey('+rotationY+'deg) rotatez('+rotationZ+'deg) translatez('+translateZ+'px);')+' '
		+multiBrowserCSS('perspective-origin:',perspectiveOrigin+';')+' '
		+multiBrowserCSS('transition:',options.easetype+';')+' '
		+multiBrowserCSS('box-shadow:',options.pageShadow+';')+' '
		+multiBrowserCSS('transform-origin:',options.transformOrigin+';')+'"/>';
		
	}
	
	function hover3dbook(e,pagesNum,hoverfactor){
		
		//FIX proportional
		var computo=250;
		if (pagesNum>computo){
			hoverfactor=Math.abs(hoverfactor-((pagesNum/computo)/2));
		}
		
		
		var pagesSimulated=pagesNum*(bigBooks(options.pagesSimulateFactor)/100);
		var pogressiveRotation=options.rotationY;
		var prgressiveadd;
		var translateProgress=pagesSimulated;
		for(p=0;p<pagesSimulated+2;p++){
			
			if (p<(pagesSimulated/2)){
				prgressiveadd=(Math.abs(((pagesSimulated/2)-p)));
				pogressiveRotation=options.rotationY+(prgressiveadd*hoverfactor);
			} else {
				prgressiveadd=(p-(pagesSimulated/2));
				pogressiveRotation=options.rotationY-(prgressiveadd*hoverfactor);
			}
			
			translateProgress=-Math.abs(translateProgress+1);
			$("img", e).eq(p).css({transform:'rotatey('+pogressiveRotation+'deg) rotatez('+options.rotationZ+'deg) translatez('+(translateProgress*options.pagesSimulateSpace)+'px)'});
			
		}
	}
	
	function unhover3dbook(e,pagesNum){
		var pagesSimulated=pagesNum*(bigBooks(options.pagesSimulateFactor)/100);
		var translateProgress=pagesSimulated;
		for(p=0;p<pagesSimulated+2;p++){
			translateProgress=-Math.abs(translateProgress+1);
			$("img", e).eq(p).css({transform:'rotatey('+options.rotationY+'deg) rotatez('+options.rotationZ+'deg) translatez('+(translateProgress*options.pagesSimulateSpace)+'px)'});
		}
	}
	
	function multiBrowserCSS(param,values){
		var prefixes=['-moz-','-webkit-','-ms-',''];
		var outputString="";
		
		for (m=0;m<prefixes.length;m++){

				outputString+=prefixes[m]+param+' '+values+' ';

		}
		return outputString;
	}
	
	function bigBooks(pages){
		var result=pages;
		if (pages>500){
			result = pages / 1.8;
		} 
		return result;
	}
	
	
  };
})(jQuery);