$(document).ready(function(){

$('.libro img:last').load(function(){
		$(".libro").threeDbook();
		
	});
actualizar_totales();

//SELECTOR PAIS
$('#carga_dinamica select').live('change', function() {
	
	if (this.value!="0"){
		$(this).slideUp();
		
		//PONEMOS CARGA
		$("#totales").html("<img src='img/status.gif'/>");
		
		$('#carga_dinamica').load('precios_totales.php',{ pais: this.value }, function() {	
			//alert("cargado");
			
			//CARGAMOS FORMULARIO PAYPAL
			
		});
	}
});

//AL BORRAR CARRITO
$(".eliminar").click(function() {
	actualizar_totales();
	//$(this).closest(".prod").slideUp();
	$(this).closest(".prod").addClass("eliminado");
	var este=this;
	setTimeout(func, 300);
function func() {
	 $(este).closest(".prod").css("width","0px");
   //$(este).closest(".prod").hide();
   
}
	

});

 function actualizar_totales(){
	 $('#carga_dinamica').load('precios_totales.php', function() {	
	
		//alert("eliminado");
  	});
	 }
 
 
});//FINAL DOCUMENT READY