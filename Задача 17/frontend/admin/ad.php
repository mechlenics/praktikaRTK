<?php
$gold = $_POST['fun'];

switch ($gold) {
    case '0':
        header('location: user/create.php');
        break;
    case '1':
        header('location: user/change.php');
        break;
    case '2':
        header('location: user/delete.php');
        break;
    case '3':
        header('location: user/role.php');
        break;
}
switch ($_GET['function']){
    case '0':
        header('location: trip/Add.php');
        break;
    case '1':
        header('location: trip/change.php');
        break;
    case '2':
        header('location: trip/delete.php');
        break;
}