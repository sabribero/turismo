<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>
<jsp:include page="partials/head.jsp"></jsp:include>






<!-- Probando fondo de pagina -->
<style>
body {
    height: 500px;
  background-image: url("src/webapp/assets/BG_TM.jpg");
  background-repeat:no-repeat;
  background-position-x:center;
  background-position-y:center;
  background-size: 10rem;
}
</style>

  <!-- Hasta aca el codigo de formato de pagina -->

</head>
<body>

	<jsp:include page="partials/nav.jsp"></jsp:include>

	<div class="container contenedor" id="index">
		<div class="row justify-content-center headercentrado">
			<div class="col-8">
				<h1>Ingresar</h1>
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
				<form method="post">
					<div class="form-floating formularioespaciado">
						<input type="text" class="form-control" id="nombreUsuario"
							placeholder="Usuario"> <label for="nombreUsuario">Nombre
							de usuario</label>
					</div>
					<div class="form-floating formularioespaciado">
						<input type="password" class="form-control" id="password"
							placeholder="Password"> <label for="password">Contraseña</label>
					</div>
					<button type="button" onclick="funcionIngresar()"
						class="btn btn-primary formularioespaciado mx-auto" id="boton">Ingresar</button>
					<p id=textoOculto></p>
				</form>
			</div>
		</div>
	</div>


	<!-- Probando un login -->

	<br>
	<br> Aca voy a probar un formulario de login mas completo que el
	de arriba. No detecta el servlet y si lo agrego en web.xml se rompe todo el servidor.

	<br>
	<br>
	<br>



	<form action="login" method="POST">
		<input type="text" name="user" value="usuario" /> <input
			type="password" name="password" value="contraseña" /> <input
			type="submit" value="Enviar" />
	</form>

	<br>
	<br>
	<br>


</body>

</html>
