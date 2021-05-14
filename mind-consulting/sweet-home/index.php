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
$ordem = $_GET['o'] ?? "n";
$chave = $_GET['c'] ?? "";
?>
<div id="corpo">
<?php include_once "includes/topo.php"; ?>
<h1>Escolha seu Móvel</h1>
<form method="get" id="busca" action="index.php">
Ordenar: 
<a href="index.php?o=n&c=<?php echo $chave;?>">Nome</a> | 
<a href="index.php?o=p&c=<?php echo $chave;?>">Distribuidora</a> | 
<a href="index.php?o=n1&c=<?php echo $chave;?>">Nota Alta</a> | 
<a href="index.php?o=n2&c=<?php echo $chave;?>">Nota Baixa</a> |
<a href="index.php">Mostrar Todos</a> |
Buscar: <input type="text" name="c" size="10" maxlength="40"/>
<input type="submit" value="Ok"/> 
</form>
<table class="listagem">
<?php
$q = "select m.cod, m.nome, g.genero, d.distribuidora, m.capa from moveis m join generos g on m.genero = g.cod join distribuidoras d on m.distribuidora = d.cod ";
if (!empty($chave)) {
	$q .= "WHERE m.nome like '%$chave%' OR d.distribuidora like '%$chave%' OR g.genero like '%$chave%' ";
}
switch ($ordem) {
	case "p":
	$q .= "ORDER BY d.distribuidora";
	break;
	case "n1":
	$q .= "ORDER BY m.nota DESC";
	break;
	case "n2":
	$q .= "ORDER BY m.nota ASC";
	break;
	default:
	$q .= "ORDER BY m.nome";
	break;
}
$busca = $banco->query($q);
if(!$busca) {
	echo "<tr><td>Infelizmente a busca deu errado";
} else {
	if($busca->num_rows == 0) {
		echo "<tr><td>Nenhum registro encontrado";
	} else {
		while($reg=$busca->fetch_object()) {
			$t = thumb($reg->capa);
			echo "<tr><td><img src='$t' class='mini'/><td>";
			echo "<td><a href='detalhes.php?cod=$reg->cod'>$reg->nome</a>";
			echo " [$reg->genero]";
			echo "<br/>$reg->distribuidora";
			if (is_admin()) {
				echo "<td>";
				echo "<i class='material-icons'>add_circle</i> ";
				echo "<i class='material-icons'>edit</i> ";
				echo "<i class='material-icons'>delete</i> ";
			} else if (is_editor()) {
				echo "<td>";
				echo "<i class='material-icons'>edit</i> ";
			}
		}
	}
}
?>
</table>
</div>
</body>
</html>