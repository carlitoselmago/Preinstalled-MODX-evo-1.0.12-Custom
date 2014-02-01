<?php

function limpiar_nombre($nombre){
	$procesado=trim($nombre);
	$procesado.str_replace(" ", "_", $procesado);
	
	return $procesado;
}

function crear_cache($la_id,$cache_uri,$id_enviada){
	global $modx;
	
	
	if ($id_enviada==""){ 
				$extra_url='';
			} else {
				//$_SESSION['id_pagina_dinamica']=$id_pagina_dinamica;
				$extra_url='?id_externa='.$id_enviada; 
				 
			}
	
	$la_url="http://".$_SERVER['HTTP_HOST'].$modx->makeUrl($la_id).$extra_url;

	$contenidos=curl_get_file_contents($la_url);

	if (file_put_contents($cache_uri, $contenidos)){ 
		//Make it writeable
		chmod($cache_uri,0777);
		echo $contenidos;
		return true;
	
	} else {
		return false;
	}
}


function curl_get_file_contents($URL)
    {
        $c = curl_init();
        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c, CURLOPT_URL, $URL);
        $contents = curl_exec($c);
        curl_close($c);

        if ($contents) return $contents;
            else return FALSE;
    }
	

function limpiar_todo_el_cache($carpeta_cache){
	
	$path_a_borrar='../'.$carpeta_cache.'/*';
	//debug_to_console( $path_a_borrar );
	$files = glob($path_a_borrar); // get all file names

	foreach($files as $file){ // iterate files
		
	  if(is_file($file))
		//echo 'Custom Cache: deleted file :'.$file."<br>";
		unlink($file); // delete file
	}
	
}

function debug_to_console( $data ) {

    if ( is_array( $data ) )
        $output = "<script>console.log( 'Debug Objects: " . implode( ',', $data) . "' );</script>";
    else
        $output = "<script>console.log( 'Debug Objects: " . $data . "' );</script>";

    echo $output;
}
	
?>