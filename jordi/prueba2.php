<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php 

		$nombre_proyecto = $_POST["nombre"];
		$campo_scrum_master = $_POST["campo_scrum_master"];
		$campo_product_owner = $_POST["campo_product_owner"];

		
		echo $nombre_proyecto;
		echo "<br>";
		echo $campo_scrum_master;
		echo "<br>";
		echo $campo_product_owner;
		echo "<br>";

		$radio = $_POST["checkbox"];
                foreach ($radio as $key => $value) {
                    echo "<br>$value";
                }
	 ?>
</body>
</html>