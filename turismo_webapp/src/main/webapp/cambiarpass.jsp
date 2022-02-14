<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<link rel="shortcut icon" href="FAVICO-TMA.png" />

<jsp:include page="partials/head.jsp"></jsp:include>

<link href="assets/css/estilos.css" rel="stylesheet" type="text/css">

</head>
<body class="bg-general">

	<jsp:include page="partials/nav.jsp"></jsp:include>


	<div class="container contenedor">

		<header class="headercentrado">
			<h1>
				<c:out value="${user.nombre}" />
			</h1>

		</header>

		<c:if test="${flash != null}">
			<div class="${colormsg}">
				<p>
					<c:out value="${flash}" />
				</p>
			</div>
		</c:if>

		<form action="cambiarpass" method="post" class="formcentrado">

			<div class="mb-3">
				<label for="username" class="form-label">Contraseña Actual</label>
				<input type="password" class="form-control" name="old-password">
			</div>

			<br>

			<div class="mb-3">
				<label for="password" class="form-label">Nueva Contraseña</label> <input
					type="password" class="form-control" name="new-password">
			</div>

			<br>

			<div class="mb-3">
				<label for="password" class="form-label">Repetir Contraseña</label>
				<input type="password" class="form-control" name="re-password">
			</div>

			<br>

			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
			</div>
		</form>

		<form action="cambiarpass" " method="get">
			<button type="submit" class="btn btn-lg btn-success">Volver</button>
		</form>

	</div>
</body>
</html>