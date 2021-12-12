

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>
<jsp:include page="partials/head.jsp"></jsp:include>

<link href="assets/css/estilos.css" rel="stylesheet" type="text/css">





</head>
<body class="bg-general">



	<div id="index">
		<div class="row justify-content-center headercentrado">
			<div class="col-8">
			
			
			
			
				<!-- 
				<h1>Bienvenido a la tierra media</h1>
				
				
				IMAGEN DE BIENVENIDA
				 -->

				<img src="/AP_parte3_webv02/assets/welcome.png" />
				<p>
					<strong>Ingresar como nombre cualquiera de los usuarios
						del proyecto (Sam, Frodo, etc.) y como contraseña se repite el mismo nombre.</strong>
				</p>

			</div>
		</div>


		<main>

			<c:if test="${flash != null}">
				<div class="alert alert-danger">
					<p>
						<c:out value="${flash}" />
					</p>
				</div>
			</c:if>

			<form action="/AP_parte3_webv02/login" method="post">

				<div class="mb-3">
					<label for="username" class="form-label">Usuario</label> <input
						class="form-control" name="username">
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Contraseña</label> <input
						type="password" class="form-control" name="password">
				</div>

				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-lg btn-primary">Ingresar</button>
				</div>
			</form>

		</main>
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







</body>

</html>
