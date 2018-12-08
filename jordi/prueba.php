<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<script type="text/javascript" src="prueba.js"></script>
		<link rel="stylesheet" type="text/css" href="prueba.css">
		<title>formulario</title>
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
				echo "<p> $respuesta[name_proj] <br></p>";
			}
			else{
				echo "<p>Error</p>";
			}
		 ?>

		<input type="button" name="crearProyecto" value="Crear nuevo proyecto" id="botonCrearProyecto" onclick="crearFormulario()" >

		<div id="formulario" hidden>

			<div id="formulario_izquierda">
			</div>
			<div id="formulario_derecha">
			</div>
		</div>
		
	</body>
</html>