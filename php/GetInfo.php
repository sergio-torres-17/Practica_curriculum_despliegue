<?php
include 'querys.php';
$dominioPermitido = "http://localhost";
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers: content-type");
header("Access-Control-Allow-Methods: OPTIONS,GET,PUT,POST,DELETE");
$inst = new Querys();
echo $inst->getTotalInfo();

?>