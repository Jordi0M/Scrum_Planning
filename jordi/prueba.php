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

	   		$pdo = new PDO("mysql:host=localhost;dbname=scrum2","root","");		 
			// Prepare
			$consulta = $pdo->prepare("SELECT name FROM users where rol = 'ScrumMaster'");
			$consulta2 = $pdo->prepare("SELECT name FROM users where rol = 'ProductOwner'");
			$consulta3 = $pdo->prepare("SELECT name FROM users where rol = 'Developer'");
			// Excecute
			$consulta->execute();
			$consulta2->execute();
			$consulta3->execute();
			$respuesta = $consulta->fetch();
			$respuesta2 = $consulta2->fetch();
			$respuesta3 = $consulta3->fetch();

		 ?>
		
		<div id="id_boton" >
			
		</div>
		<div id="div_formulario" hidden>
			<form id="formulario" method="post" action="prueba2.php">
				<div id="formulario_izquierda">
				</div>
				<div id="formulario_derecha">
				</div>
			</form>
		</div>
			

		<script type="text/javascript">
			
			//combobox scrum_master
			var select_combobox_scrum = document.createElement("select");
			select_combobox_scrum.setAttribute("id", "campo_scrum_master");
			select_combobox_scrum.setAttribute("name", "campo_scrum_master");
			select_combobox_scrum.setAttribute("required", "true");
			//opciones del combobox
			var opcion_por_defecto_scrum = document.createElement("option");
			opcion_por_defecto_scrum.setAttribute("value",'');
			var texto_opcion = document.createTextNode('Scrum_master');
			opcion_por_defecto_scrum.appendChild(texto_opcion);
			select_combobox_scrum.appendChild(opcion_por_defecto_scrum);
			<?php 
			while ($respuesta) {
				?>
				var opcion_combobox_scrum = document.createElement("option");
				opcion_combobox_scrum.setAttribute("value",'<?php echo "$respuesta[name]" ?>');
				var texto_opcion = document.createTextNode('<?php echo "$respuesta[name]" ?>');
				opcion_combobox_scrum.appendChild(texto_opcion);
				select_combobox_scrum.appendChild(opcion_combobox_scrum);
				<?php
			    $respuesta = $consulta->fetch();
			}
			?>
			document.getElementById("formulario_derecha").appendChild(select_combobox_scrum);
			document.getElementById("formulario_derecha").appendChild(document.createElement("br"));


			//combobox product_owner
			var select_combobox_product = document.createElement("select");
			select_combobox_product.setAttribute("id", "campo_product_owner");
			select_combobox_product.setAttribute("name", "campo_product_owner");
			select_combobox_product.setAttribute("required", "true");
			//opciones del combobox
			var opcion_por_defecto_product = document.createElement("option");
			opcion_por_defecto_product.setAttribute("value",'');
			var texto_opcion = document.createTextNode('ProductOwner');
			opcion_por_defecto_product.appendChild(texto_opcion);
			select_combobox_product.appendChild(opcion_por_defecto_product);
			<?php 
			while ($respuesta2) {
				?>
				var opcion_combobox_product = document.createElement("option");
				opcion_combobox_product.setAttribute("value",'<?php echo "$respuesta2[name]" ?>');
				var texto_opcion = document.createTextNode('<?php echo "$respuesta2[name]" ?>');
				opcion_combobox_product.appendChild(texto_opcion);
				select_combobox_product.appendChild(opcion_combobox_product);
				<?php
			    $respuesta2 = $consulta2->fetch();
			}
			?>
			document.getElementById("formulario_derecha").appendChild(select_combobox_product);
			document.getElementById("formulario_derecha").appendChild(document.createElement("br"));
			document.getElementById("formulario_derecha").appendChild(document.createElement("br"));

			//checkbox developers
			<?php 
			while ($respuesta3) {
				?>
				var i=0;
				var checkbox = document.createElement("input");
				checkbox.setAttribute("type","checkbox");
				checkbox.setAttribute("class","checkboxes");
				checkbox.setAttribute("value",'<?php echo "$respuesta3[name]" ?>');
				checkbox.setAttribute("name",'checkbox[]');
				document.getElementById("formulario_derecha").appendChild(checkbox);
				var checkbox_label = document.createElement("label");
				var texto_label = document.createTextNode('<?php echo "$respuesta3[name]" ?>')
				checkbox_label.appendChild(texto_label);
				document.getElementById("formulario_derecha").appendChild(checkbox_label);
				document.getElementById("formulario_derecha").appendChild(document.createElement("br"));
				<?php
			    $respuesta3 = $consulta3->fetch();
			}
			?>

		</script>
		
	</body>
</html>