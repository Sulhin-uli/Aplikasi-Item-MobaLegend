<?php

$connect = new mysqli("localhost", "root", "", "db_item");

if ($connect) {
    
} else {
    echo "Connection Failed";
    exit();
}