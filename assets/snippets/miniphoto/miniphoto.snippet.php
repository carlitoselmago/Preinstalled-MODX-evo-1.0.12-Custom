<?php
/************************************************
*Added &aspectratio option 6-3-2012 by Carlos Carbonell
*
*Snippet to resize on the fly an image for galleris, etc.
*Supports jpg, gif, png and others.
*
*Use [[MiniPhoto? &file=`assets/images/photo.jpg` &width=`200` &height=`150` &quality=`93` &dir=`mini` &isclip=`1` &interlace=`0` &bgcolor=`ffffff`]]
*
*New image: assets/images/mini/photo.jpg
*With width=200, height=150, quality=93
*
*file - path to big image (is mandatory)
*width - width of mini photo
*height - height of mini photo
*quality - quality of mini photo
*dir - dir for mini photo
*aspectratio - 1 for auto calculating aspect ratio if width or height are not defined (1 default, 0 bypass)

*isclip - clip image by minimal side (default 1). If set 0, then image has been diminishing by long side, and space has been filling with &bgcolor
*interlace - set interlpase for .jpg (progressive mode)
*bgcolor - for space when isclip set 0 (hex RBG format `rrggbb`)
*
*For example with Ditto:
*<img src="[[MiniPhoto? &file=`[+tvphoto+]` &width=`108` &height=`81`]]" width="108" height="81" alt="" class="photo left" />
*
*Where tvphoto is tv parameter (photo) for image.
*************************************************/

// Path to snippet
$miniphoto_path = 'assets/snippets/miniphoto/';

// URL to "no photo" file
$nophoto = $miniphoto_path.'nophoto.png';

// Parametr "file" (path to photo) is mandatory
if (!isset($file)) return $nophoto;

// Quality of mini photo
$quality = isset($quality) ? $quality : 93;

// Aspect ratio of mini photo
$aspectratio = isset($aspectratio) ? $aspectratio : 1;

$isclip = isset($isclip) ? $isclip : 1;

$interlace = isset($interlace) ? $interlace : 0;

$bgcolor = isset($bgcolor) ? $bgcolor : 'ffffff';

// Dir for mini photo
$dir = isset($dir) && $dir ? $dir : $width.'x'.$height.'/';
if ($dir{strlen($dir)-1} != '/') $dir .= '/';

// Path to mini photo
$p_dir = dirname(($p = strpos($file, '://')) ? substr($file, strpos($file, '/', $p + 3) + 1) : ($file{0} == '/' ? substr($file, 1) : $file)).'/';
$p_img = $p_dir.basename($file);
$mp_dir = $p_dir.$dir;
$mp_img = $mp_dir.basename($file);

if (file_exists($modx->config['base_path'].$mp_img)) {
    //return '/'.$mp_img;
	return $mp_img;
}

return include($miniphoto_path.'miniphoto.inc.php');
?>