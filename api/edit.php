
<?php



include 'koneksi.php';



$id = $_POST['id'];

$name = $_POST['name'];

$type = $_POST['type'];

$effect = $_POST['effect'];

$special_attribut= $_POST['special_attribut'];



$connect->query("UPDATE item SET name='".$name."', type='".$type."', effect='".$effect."', special_attribut='".$special_attribut."' WHERE id=". $id);



?>