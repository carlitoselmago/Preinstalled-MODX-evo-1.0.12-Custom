setTimeout(function() {
 !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
}, 0);

$(document).ready(function(){

$('.bloc.prod img:last').load(function(){
	$( ".bloc.prod" ).each(function( index ) {
		var altura=$("img" ,this ).height()+$("h1" ,this ).height()+$("h2" ,this ).height()+parseInt($("h2" ,this ).css('marginTop'));
		var alturamax=$(".frame" ,this ).height()
		console.log(altura);
		if (altura>alturamax){
			console.log( (($("img", this ).height()-(altura-alturamax))) );
			$("img", this ).css("height",($("img", this ).height()-(altura-alturamax))+"px");
			$("img", this ).css("width","auto");
		}
	$('.bloc.prod img').show();	
});
	});

 
});//FINAL DOCUMENT READY