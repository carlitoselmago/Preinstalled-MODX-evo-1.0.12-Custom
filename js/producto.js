$(document).ready(function(){
	
//VOLVER
setTimeout(function() {

alertify.log("<a class='log_link' href='http://www.apaapacomics.com/productos'><< Volver a productos</a>","", 0);
	

}, 4000);


	//scroll to visor
	$(".mini").live("click", function(){
		//$("body").scrollTo( '.fotos', 800 );
		$("body").scrollTo( {top:'140px', left:'0px'}, 800 );
	});

	
	//FLIP
	$(".buy.digital").mouseenter(function(e){
		if ($(this).find(".front .signo").length > 0) {
			
		} else {
		var back=$(this).find(".back").html();
		
		$(".buy .digital.front").flippy({
		color_target: "#309261",
		duration: "200",
		direction: 'top',
		verso: back
		});
		 e.preventDefault();
		 }
    }).mouseleave(function(){
      $(".buy .digital.front").flippyReverse();
    });
	
	$(".buy.impreso").mouseenter(function(e){
		if ($(this).find(".front .signo").length > 0) {
			
		} else {
		var back2=$(this).find(".back").html();
		
		$(".buy .impreso.front").flippy({
		color_target: "#309261",
		duration: "200",
		direction: 'top',
		verso: back2
		});
		 e.preventDefault();
		 }
    }).mouseleave(function(){
      $(".buy .impreso.front").flippyReverse();
    });
	
	
	
	//TRUCO ALTO SLIDER
	var anchofoto=$("#slide").width();
	
	// $(window).resize(function() {
		// $('#log').append('<div>Handler for .resize() called.</div>');
	// });
	

	//SLIDE FOTOS
	$('#slide img:last').load(function(){
		$('.fotos').css({ opacity: 1 });
		
		var altura=$("#slide img:first-child").height();
		
		
		 var opts ={ 
			fx: 'scrollHorz', 
			timeout: 0, 
			fit: 1,
			width: anchofoto,
			height: altura,
			activePagerClass: 'activeSlide',
			pager:  '#thumbs', 
			 
			// callback fn that creates a thumbnail to use as pager anchor 
			pagerAnchorBuilder: function(idx, slide) { 
				
				$("#slide span").zoom();
				//$('#slide img').zoom();
				//var srcslide=slide.find("img").attr("src");
				//console.log(slide.firstChild.src);
				return '<div class="mini"><img src="' + slide.firstChild.src+ '" width="auto" height="70" /></div>'; 
			} 
		} 
		
		
		if ($(window).width() > 700) {
		   $('#slide').cycle(opts);
		}
		else {
		$('.fotos').css({ opacity: 1 });
		  $('#slide span').eq(0).find("img").css("display","block");
		}
				
		
		
		
		 $(window).resize(function(){
			if ($(window).width() > 700) {
			opts.width = $(".fotos").width();
		   opts.height = $("#slide img:first-child").height();
			$('#slide').cycle('destroy');
		   $('#slide').cycle(opts);
		   } else {
			//
		  }
		});
		
		
		$("#test").zoom();
	});
	 
 
});//FINAL DOCUMENT READY