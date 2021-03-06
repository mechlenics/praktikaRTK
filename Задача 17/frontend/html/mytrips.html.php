<?php
session_start();
if($_COOKIE['admin']){
    header('location: php/admin.php');
}elseif (!$_COOKIE['name']){
    header('location: lichn.php');
}

$mysql = new mysqli('localhost','root','','bez_reg');
$result = $mysql->query("SELECT h.Ticketing_id, h.user_id, h.of_id, f.* FROM mytrip h LEFT JOIN trip f ON h.Ticketing_id = f.ID LEFT JOIN users u ON h.user_id = u.ID");
?>
<!DOCTYPE>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Мои поездки</title>
    <?include "../Connections/connect/css/Connections.php"?>
    <link rel = "stylesheet" href = "../Css/style.css">
</head>
<body background = "../img/seredina_dorogi_1920x1200.jpg" class="fon">
<div class="container">
    <div class="row">
        <div class="col-6 col-md-12">
            <form action="lichn.php">
                <input type="submit" value="Назад" class="btn btn-info" style="margin-left: 920px; margin-top: 200px">
            </form>
            <table class="table" style="margin-top: 30px; width: 1000px">


                <thead>
                <tr class="table-light">
                    <th scope="col"></th>
                    <th scope="col">Поездка</th>
                    <th scope="col">Время</th>
                    <th scope="col">Время в пути</th>
                    <th scope="col">Число</th>
                        <th scope="col">Кол. мест</th>
                </tr>
                </thead>
                <tbody>
                <?while ($value = $result->fetch_assoc()): ?>
                    <?if($value['user_id'] == $_COOKIE['id']): ?>
                        <?$_SESSION['GO'] = $value['user_id']?>
                        <tr  class="table-light">
                            <th scope="row">
                                <input type="hidden" name="ID" value="<?=$value['user_id']?>">
                            </th>
                            <td><?=$value['Where from'] ?> ---> <?=$value['__Where__']?></td>
                            <td><?=$value['Arrivals']?></td>
                            <td><?=$value['Time in road']?></td>
                            <td><?=$value['Day']?></td>
                            <td style="position: absolute; left: 84%"><?=$value['of_id']?></td>
                        </tr>
                    <?endif;?>
                <?endwhile;?>
                <?if($_SESSION['GO'] != $_COOKIE['id']): ?>
                <tr class="table-light">
                    <td colspan="6" align="center">
                        У вас нет поездок.
                    </td>
                </tr>
                <?endif;?>
                </tbody>
            </table>
            
        </div>
    </div>
</div>

<?include "../Connections/connect/js/Connections.php"?>
</body>
</html>