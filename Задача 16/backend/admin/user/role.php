<?php
if(!$_COOKIE['admin']){
    header('location: ../../index.php');
}
$mysql = new mysqli('localhost', 'root', '', 'bez_reg');
$result = mysqli_query($mysql, "SELECT * FROM role INNER JOIN  users ON users.role = role.ID");
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><?= $_COOKIE['admin']?></title>
    <? include "../../Connections/Connections_admin.php" ?>
    <link rel = "stylesheet" href = "../../Css/style.css">
</head>
<body background="../../img/look.com.ua-188538.jpg" class="fon">
    <div class="container">
        <div class="row">
            <div class="col-6 col-md-4">
                <table class="table r">
                    <thead>
                    <tr class="table-secondary">
                        <th scope="col">0</th>
                        <th scope="col">1</th>
                        <th scope="col">2</th>
                        <th scope="col">3</th>
                        <th scope="col">4</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="table-secondary">
                        <td>Рядовой</td>
                        <td>Сержант</td>
                        <td>Ветеран</td>
                        <td>Admin</td>
                        <td>Нет роли</td>
                    </tr>
                    </tbody>
                </table>
                <form action="../../php/admin.php" class="left">
                    <input type="submit" value="Назад" class="top btn btn-warning" >
                </form>
            </div>
            <div class="col-6 col-md-7">
                <table class="table">
                    <thead>
                    <tr class="table-secondary">
                        <th scope="col">#</th>
                        <th scope="col">login</th>
                        <th scope="col">role</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <? while ($value = $result->fetch_assoc()) : ?>
                        <tbody>
                        <tr class="table-secondary">
                            <th scope="row"><?=$value['ID']?></th>
                            <td><?=$value['login']?></td>
                            <td><?=$value['role']?></td>
                            <td class="table-dark">
                                <form action="code/code_delete_role.php" method="post">
                                    <input type="hidden" name="ID" value="<?=$value['ID']?>">
                                    <input type="submit"   value="Удалить" class="btn btn-link">
                                </form>
                            </td>
                            <td class="table-dark">
                                <form action="code/code_role.php" method="post" >
                                    <input type="hidden" name="ID" value="<?=$value['ID']?>">
                                    <div class=" form-group">
                                        <select class="form-control" id="exampleFormControlSelect1"  name="role">
                                            <option value="0">Рядовой</option>
                                            <option value="1">Сержант</option>
                                            <option value="2">Ветеран</option>
                                            <option value="3">Admin</option>
                                        </select>
                                        <td>
                                            <input type="submit" class="btn btn-link " value="Поменять роль">
                                        </td>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        </tbody>
                    <?endwhile;?>
                </table>
            </div>
            <div class="col-6 col-md-1"></div>
        </div>
    </div>
</body>
</html>