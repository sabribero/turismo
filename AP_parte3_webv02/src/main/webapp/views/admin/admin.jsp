<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<jsp:include page="../../partials/view-head.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="../../partials/view-nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="modificar.jsp">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="agregar.jsp">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="ver.jsp">Ver</a></li>
			<li class="nav-item"><a class="nav-link" href="eliminar.jsp">Eliminar</a></li>
		</ul>
		<main class="contenido">
			<div class="headercentrado">
				<h1>BIENVENIDO ADMIN!</h1>
				<p>Seleccione una de las siguientes opciones:</p>
			</div>
			<br>
		
			<div class="container-fluid">
				<div class="row justify-content-around">
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Tipos de atracción</h5>
						<ul class="separarli">
							<li><a href="modificar.jsp#tipos_de_atraccion">Modificar</a></li>
							<li><a href="agregar.jsp#tipos_de_atraccion">Agregar</a></li>
							<li><a href="ver.jsp#tipos_de_atraccion">Ver</a></li>
							<li><a href="eliminar.jsp#tipos_de_atraccion">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Atracciones</h5>
						<ul class="separarli">
							<li><a href="modificar.jsp#atracciones">Modificar</a></li>
							<li><a href="agregar.jsp#atracciones">Agregar</a></li>
							<li><a href="ver.jsp#atracciones">Ver</a></li>
							<li><a href="eliminar.jsp#atracciones">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Promociones</h5>
						<ul class="separarli">
							<li><a href="modificar.jsp#promociones">Modificar</a></li>
							<li><a href="agregar.jsp#promociones">Agregar</a></li>
							<li><a href="ver.jsp#promociones">Ver</a></li>
							<li><a href="eliminar.jsp#promociones">Eliminar</a></li>
						</ul>
					</div>
					<div class="col-lg-3 centrado">
						<h5 class="subrayado">Usuarios</h5>
						<ul class="separarli">
							<li><a href="modificar.jsp#usuarios">Modificar</a></li>
							<li><a href="agregar.jsp#usuarios">Agregar</a></li>
							<li><a href="ver.jsp#usuarios">Ver</a></li>
							<li><a href="eliminar.jsp#usuarios">Eliminar</a></li>
						</ul>
					</div>
				</div>
			</div>
			<br>
			<br>
	
			<div class="container">
				<div class="row align-items-start excepciona">
					<a href="../../index.jsp" class="btn btn-danger btn-lg">Salir</a>
				</div>
			</div>
		</main>
	</div>
</body>
</html>