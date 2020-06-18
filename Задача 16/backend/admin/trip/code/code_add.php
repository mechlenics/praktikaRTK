<?php
session_start();

$W = $_POST['W'];
$_W_ = $_POST['_W_'];
$D = $_POST['D'];
$Arr = $_POST['Arr'];
$Time = $_POST['Time'];
$price = $_POST['price'];

$mysql = new mysqli('localhost', 'root', '', 'bez_reg');
include 'arr.php';



for($i=0; $i<count($arr); $i++){
    if($W == $arr[$i]){
        for($j=0; $j<count($array); $j++){
            if($_W_ == $array[$j]){
                $result = $mysql->query("INSERT INTO `trip` (`Where from`,`__Where__`,`Day`,`Arrivals`,`Time in road`,`price`) VALUE ('$W','$_W_','$D','$Arr','$Time','$price')");
                if($result == true){
                    header('location: ../Add.php');
                    exit();
                }else{
                    header('location: ../Add.php');
                    exit();
                }
            }
        }
    }
}
if($W != $arr[$i]){
    $_SESSION['admin'] = "Город ".$W." был не коректно веден или в этом городе нет поездок";
    header('location: ../Add.php');
    exit();
}elseif($_W_ != $array[$j]){
    $_SESSION['admin'] = "Город ".$_W_." был не коректно веден или в этом городе нет поездок";
    header('location: ../Add.php');
    exit();
}