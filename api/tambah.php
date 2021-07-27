<?php

	include 'koneksi.php';
    	
$name = $_POST['name'];

$type = $_POST['type'];

$effect = $_POST['effect'];

$special_attribut= $_POST['special_attribut'];

	$connect->query("INSERT INTO item (name,type,effect,special_attribut) 
	VALUES 
	('".$name."','".$type."','".$effect."','".$special_attribut."')");

?>