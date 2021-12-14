<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>


<link rel="stylsheet" type="text/css" href="/AP_parte3_webv02/assets/css/estilos.css" />

</head>
<body class="bg-general">


	
	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/views/user/user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/user/ofertador.do">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/itinerario.do">Mi Itinerario</a></li>
		</ul>
	
		<div class="contenido">
				<h1 class="titulo">Atracciones</h1>
				<div class="row row-cols-4">
				
				
				
					<c:forEach items="${attractions}" var="atraccion">
						<div class="card col">
						
						
						<div class="contenedor">
							<img src="../assets/atraccion.png" class="card-img-top" alt="...">

							</div>

							 
							<div class="card-body">
								<h5 class="card-title" id="${atraccion.nombre.replace(' ','')}"><c:out value="${atraccion.nombre}"></c:out></h5>
								<h6 class="card-text"><c:out value="${atraccion.tipo.getNombre()}"></c:out></h6>
								<p class="card-text">Costo: <c:out value="${atraccion.valor}"></c:out> monedas</p>
								<p class="card-text">Duraci&oacute;n: <c:out value="${atraccion.tiempoDeUso}"></c:out> hora/s</p>
								<p class="card-text">Cupos: <c:out value="${atraccion.usosDisponibles}"></c:out></p>
								
							<c:choose>
								<c:when
									test="${user.podesIrA(atraccion) && user.todaviaNoVasA(atraccion) && atraccion.podesRecibir()}">
									<a href="/AP_parte3_webv02/attractions/buy.do?nombre=${atraccion.getNombre().replace(' ','%')}"
										class="btn btn-success rounded excepciona" role="button">Comprar</a>
								</c:when>
								<c:otherwise>
									<a href="" class="btn btn-secondary rounded disabled excepciona"
										role="button">No se puede comprar</a>
								</c:otherwise>
							</c:choose>
								
							</div>
						</div>
					</c:forEach>
				</div>
			<h1 class="titulo" id="titulo1">Promociones:</h1>
			<div class="row row-cols-4">
				<c:forEach items="${promociones}" var="promocion">
					<div class="card col">
					
							<div class="contenedor">
								<img src="../assets/promocion.png" class="card-img-top" alt="...">
 
							</div>		
						
						<div class="card-body">
							<h5 class="card-title"><c:out value="${promocion.tipo}"></c:out></h5>
							<p class="card-text">
								<c:forEach items="${promocion.atraccionesEnPromocion}" var="attraction">
									<a href="#${attraction.nombre.replace(' ','')}"><c:out value="${attraction.nombre}"></c:out></a><br>
								</c:forEach>
							</p>
							<p class="card-text">Costo: <c:out value="${promocion.getValorPromo()}"></c:out> monedas</p>
							<p class="card-text">Duraci&oacute;n: <c:out value="${promocion.getTiempoDeUso()}"></c:out> hora/s</p>
							
							<c:choose>
								<c:when
									test="${user.podesIrA(promocion) && promocion.tieneCupos()}">
									<a href="/AP_parte3_webv02//promociones/buy.do?id=${promocion.id}"
										class="btn btn-success rounded excepciona" role="button">Comprar</a>
								</c:when>
								<c:otherwise>
									<a href="" class="btn btn-secondary rounded disabled excepciona"
										role="button">No se puede comprar</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	
	
</body>
</html>