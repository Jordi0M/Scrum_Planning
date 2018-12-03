<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<script type="text/javascript" src="prueba.js"></script>
	<link rel="stylesheet" type="text/css" href="prueba.css">
	<title>formulario</title>
</head>
<body>

	<input type="button" name="crearProyecto" value="Crear nuevo proyecto">

	<div class="formulario">
		<h1 class="titulo">Formulario</h1>
		<div class="formulario_izquierda">
			<br>
			<label for="nombre">Nombre</label>
			<input type="text" name="nombre">
			<br><br>
			<label for="descripcion">Descripcion</label>
			<textarea name="descripcion"></textarea>
		</div>
		<div class="formulario_derecha">
			
			<select>
				<option>Scrum</option>
				<option>prueba</option>
			</select>
			<br>
			<select>
				<option>Project</option>
				<option>prueba</option>
			</select>
			<br><br>
			<input type="radio" name="developer1" value="developer1">developer1
			<br>
			<input type="radio" name="developer2" value="developer2">developer2
			<br>
		</div>

	</div>
		
		<p></p>
	</div>

</body>
</html>