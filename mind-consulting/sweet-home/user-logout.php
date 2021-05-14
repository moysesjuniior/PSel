<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Sweet Home</title>
<meta charset="UTF-8"/>
<link rel="stylesheet" href="css/style.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<?php
require_once "includes/banco.php";
require_once "includes/login.php";
require_once "includes/funcoes.php";
?>
<div id="corpo">
    <?php
    logout();
    echo msg_sucesso('Usuário desconectado com sucesso.');
    echo voltar();
    ?>
</div>
</body>
</html>