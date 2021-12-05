<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>
<jsp:include page="partials/head.jsp"></jsp:include>

<link href="assets/css/estilos.css" rel="stylesheet" type="text/css">



<!-- Hasta aca el codigo de formato de pagina -->

</head>
<body class="bg-general">

	<jsp:include page="partials/nav.jsp"></jsp:include>

	<div id="index">
		<div class="row justify-content-center headercentrado">
			<div class="col-8">
				<!-- 
				<h1>Bienvenido a la tierra media</h1>
				
				
				IMAGEN DE BIENVENIDA
				 -->

				<img src="assets/welcome.png" />
				<p>
				<p>
				<p>
					<strong>Ingresar como nombre "user" para entrar como
						usuario y "admin" para entrar como administrador</strong>
				</p>
				<p>La idea es que cuando ingresemos con un "usuario" y
					"contraseña" verifiquemos (con los datos de la DB) primero que el
					usuario exista y despues, si el usuario existe, verificamos si es
					un admin o un usuario normal e ingresamos a la pagina
					correspondiente.</p>
			</div>
		</div>



		<div class="row justify-content-center">
			<div class="col-6">


				<form action="login" method="POST">
					<input type="text" name="username" value="usuario" /> <input
						type="password" name="password" value="contraseña" /> <input
						type="submit" value="Enviar" />
				</form>

			</div>
		</div>
	</div>




	<!-- Probando un login 

	<br>
	<br> Aca voy a probar un formulario de login mas completo que el
	de arriba. No detecta el servlet y si lo agrego en web.xml se rompe
	todo el servidor.

	<br>
	<br>
	<br>

		<div class="row justify-content-center">
			<div class="col-6">
	<form action="login" method="POST">
		<input type="text" name="username" value="usuario" /> <input
			type="password" name="password" value="contraseña" /> <input
			type="submit" value="Enviar" />
	</form>

			</div>
		</div>


	<form action="login" method="POST">
		<input type="text" name="username" value="usuario" /> <input
			type="password" name="password" value="contraseña" /> <input
			type="submit" value="Enviar" />
	</form>
	
	
	
	
-->
	<br>
	<br>
	<br>


	<footer style="width: 100%; margin-left: 0px;" position>


		<div class="foot" style="background-color: #0d47a1;">
			<div class="container-fluid"
				style="background-color: #0d47a1; color: #bbdefb;">Tierra
				Media - Argentina Programa - Grupo Ameba</div>
		</div>

		<br> <br>

		<p>&copy; Tierra Media 2021 - Marca registrada</p>


		<div class="container-lg">


			<a href="">Acerca de</a> <a href="">Conectar</a> <a href="">Redes
				Sociales</a>
		</div>


	</footer>




</body>

</html>
