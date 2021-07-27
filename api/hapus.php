
<?php

include 'koneksi.php';

$id=$_POST['id'];

$connect->query("DELETE FROM item WHERE id=".$id);



?>

