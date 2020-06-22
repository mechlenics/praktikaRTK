<?php
session_start();

if (isset($_GET['data'])){
    $_SESSION['data'] = true;
    header('location: ../html/lichn.php');
} elseif (isset($_GET['role'])){
    $_SESSION['rol'] = true;
    header('location: ../html/lichn.php');
} elseif (isset($_GET['exit'])){
    header('location: exit.php');
} elseif (isset($_GET['mytrip'])){
    header('location: ../html/mytrip.html.php');
}
