<?php
if(!empty($_POST['html']) && !empty($_POST['css'])) {
	require "emogrifier.php";

	$htmlfile = $_POST['html'];
	$stylesheet = $_POST['css'];

	$html_string = file_get_contents($htmlfile,NULL,NULL);
	$css_string = file_get_contents($stylesheet,NULL,NULL);
	$css_string = preg_replace('!\n+!',' ',$css_string);
	$css_string = preg_replace('!\s+!',' ',$css_string);

	$Emogrifier = new Emogrifier;
	$Emogrifier->setHTML($html_string);
	$Emogrifier->setCSS($css_string);

	echo $Emogrifier->emogrify();
}
?>