<?php

include 'koneksi.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult = $connect->query("SELECT * FROM users WHERE username = '" . $username . "' and password = '" . $password . "'");

$result = array();

while ($fetcData = $queryResult->fetch_assoc()) {
    $result[] = $fetcData;
}

echo json_encode($result);