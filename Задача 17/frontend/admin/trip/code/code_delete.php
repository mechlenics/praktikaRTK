<?php
$id = $_POST['ID'];

$mysql = new mysqli('localhost', 'root', '', 'bez_reg');
$result = $mysql->query("DELETE FROM `trip` WHERE ID=" . $id);

header('location: ../delete.php');