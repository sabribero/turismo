<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/tiposdeatraccion.do">Tipos de atracci&oacute;n</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/atracciones.do">Atracciones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/promociones.do">Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/usuarios.do">Usuarios</a></li>
		</ul>
		<main class="contenido">
			<div class="headercentrado">
				<h1>Bienvenido <c:out value="${user.nombre}" />!</h1>
				<br>
				

		
		
		<br>
				<p><a href="/turismo_webapp/cambiarpass.jsp"> Cambiar contraseña</a></p>
				<p>Opciones:</p>
			</div>
			<br>
		
			<div class="container-fluid">
				<div class="row justify-content-around">
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Tipos de atracción</h5>
						<ul class="separarli">
							<li>>Modificar</li>
							<li>Agregar</li>
							<li>Ver</li>
							<li>Eliminar</li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Atracciones</h5>
						<ul class="separarli">
							<li>Modificar</li>
							<li>Agregar</li>
							<li>Ver</li>
							<li>Eliminar</li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Promociones</h5>
						<ul class="separarli">
							<li>Modificar</li>
							<li>Agregar</li>
							<li>Ver</li>
							<li>Eliminar</li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Usuarios</h5>
						<ul class="separarli">
							<li>Modificar</li>
							<li>Agregar</li>
							<li>Ver</li>
							<li>Eliminar</li>
						</ul>
					</div>
				</div>
			</div>
			<br>
			<br>
			
			
		</main>
	</div>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>