<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	<body>

		<?php 

   		$pdo = new PDO("mysql:host=localhost;dbname=scrum","root","");		 
		// Prepare
		$consulta = $pdo->prepare("SELECT name_proj FROM proj_users where user = 'lzabala'");
		// Excecute
		$consulta->execute();
		$respuesta = $consulta->fetch();
		if ($respuesta) {
			echo "<p style='background-color:#66FF33'> $respuesta[name_proj] <br></p>";
		}
		else{
			echo "<p style='background-color:red'>Error</p>";
		}
	 ?>

	</body>
</html>