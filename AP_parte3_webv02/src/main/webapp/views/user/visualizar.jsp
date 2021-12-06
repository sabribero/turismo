<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<jsp:include page="../../partials/view-head.jsp"></jsp:include>

</head>
<body>
	
	<jsp:include page="../../partials/view-nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="sugeridor.jsp">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="itinerario.jsp">Mi Itinerario</a></li>
		</ul>
	
		<div class="contenido">
			
		
				<h3 class="titulo" id="titulo1">Promociones</h3>
			<div class="row justify-content-evenly">	
				<div class="card col-lg-2">
			<!-- imagen default -->
					<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Promoción 1</h5>
						<p class="card-text">Descripción</p>
						<p class="card-text">Costos</p>
					</div>
				</div>
				<div class="card col-lg-2">
					<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Promoción 2</h5>
						<p class="card-text">Descripción</p>
						<p class="card-text">Costos</p>
					</div>
				</div>
				<div class="card col-lg-2">
					<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Promoción 3</h5>
						<p class="card-text">Descripción</p>
						<p class="card-text">Costos</p>
					</div>
				</div>
				<div class="card col-lg-2">
					<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Promoción 4</h5>
						<p class="card-text">Descripción</p>
						<p class="card-text">Costos</p>
					</div>
				</div>
				</div>
				<h3 class="titulo">Atracciones</h3>
				<div class="row row-cols-4">
					<c:forEach items="${attractions}" var="atraccion">
						<div class="card col">
							<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><c:out value="${atraccion.nombre}"></c:out></h5>
								<h6 class="card-text"><c:out value="${atraccion.tipo}"></c:out></h6>
								<p class="card-text">Costo: <c:out value="${atraccion.valor}"></c:out> monedas</p>
								<p class="card-text">Duraci&oacute;n: <c:out value="${atraccion.tiempoDeUso}"> hora/s</c:out></p>
								<p class="card-text">Cupos: <c:out value="${atraccion.usosDisponibles}"></c:out></p>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- <div class="card col-lg-2">
					<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Atracción 1</h5>
						<p class="card-text">Descripción</p>
						<p class="card-text">Costos</p>
					</div>
				</div> -->
			
		</div>
	</div>
</body>
</html>