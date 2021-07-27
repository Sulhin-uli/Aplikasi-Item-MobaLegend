<?php

include 'koneksi.php';



$queryResult=$connect->query("SELECT * FROM item");



$result=array();



while($fetchData=$queryResult->fetch_assoc()){

	$result[]=$fetchData;

}



echo json_encode($result);



?>