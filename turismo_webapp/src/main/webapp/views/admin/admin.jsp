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
				<p>Seleccione una de las siguientes opciones:</p>
			</div>
			<br>
		
			<div class="container-fluid">
				<div class="row justify-content-around">
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Tipos de atracción</h5>
						<ul class="separarli">
							<li><a href="/turismo_webapp/administrador/modificar.do#tipos_de_atraccion">Modificar</a></li>
							<li><a href="/turismo_webapp/administrador/agregar.do#tipos_de_atraccion">Agregar</a></li>
							<li><a href="/turismo_webapp/administrador/ver.do#tipos_de_atraccion">Ver</a></li>
							<li><a href="/turismo_webapp/administrador/eliminar.do#tipos_de_atraccion">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Atracciones</h5>
						<ul class="separarli">
							<li><a href="/turismo_webapp/administrador/modificar.do#atracciones">Modificar</a></li>
							<li><a href="/turismo_webapp/administrador/agregar.do#atracciones">Agregar</a></li>
							<li><a href="/turismo_webapp/administrador/ver.do#atracciones">Ver</a></li>
							<li><a href="/turismo_webapp/administrador/eliminar.do#atracciones">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Promociones</h5>
						<ul class="separarli">
							<li><a href="/turismo_webapp/administrador/modificar.do#promociones">Modificar</a></li>
							<li><a href="/turismo_webapp/administrador/agregar.do#promociones">Agregar</a></li>
							<li><a href="/turismo_webapp/administrador/ver.do#promociones">Ver</a></li>
							<li><a href="/turismo_webapp/administrador/eliminar.do#promociones">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Usuarios</h5>
						<ul class="separarli">
							<li><a href="/turismo_webapp/administrador/modificar.do#usuarios">Modificar</a></li>
							<li><a href="/turismo_webapp/administrador/agregar.do#usuarios">Agregar</a></li>
							<li><a href="/turismo_webapp/administrador/ver.do#usuarios">Ver</a></li>
							<li><a href="/turismo_webapp/administrador/eliminar.do#usuarios">Eliminar</a></li>
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