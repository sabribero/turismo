<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Obtener sugerencias</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body>
	
	<jsp:include page="../../partials/nav.jsp"></jsp:include>

	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/itinerario.do">Mi Itinerario</a></li>
		</ul>
	
	<!-- el container se puede cambiar para que ocupe mas o menos espacio -->
		<div class="contenido contenidocarousel">
			<div id="carouselExampleCaptions" class="carousel carousel-dark slide" data-bs-interval="false">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" 
						aria-label="Slide 1"></button>
						<c:forEach begin="1" end="${cantidad}" step="1" var="index">
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${index}" aria-label="Slide ${index+1}"></button>
						</c:forEach>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h3>Comencemos!</h3>
						</div>
					</div>
					<c:forEach items="${promocionesFavoritas}" var="promo">
						<div class="carousel-item">
							<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Promoci&oacute;n</h5>
								<p><c:out value="${promo.getNombre()}"></c:out></p>
								<p>Costo: <c:out value="${promo.getValorPromo()}"></c:out> monedas<br>
									Duraci&oacute;n: <c:out value="${promo.getTiempoDeUso()}"></c:out> hora/s</p>
								<a href="#" class="btn btn-lg btn-primary excepciona">Comprar</a>
							</div>
						</div>
					</c:forEach>
					
					<c:forEach items="${atraccionesFavoritas}" var="atraccion">
						<div class="carousel-item">
							<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5><c:out value="${atraccion.getNombre()}"></c:out></h5>
								<p>Costo: <c:out value="${atraccion.getValor()}"></c:out> monedas<br>
									Duraci&oacute;n: <c:out value="${atraccion.getTiempoDeUso()}"></c:out> hora/s</p>
								<a href="#" class="btn btn-lg btn-primary excepciona">Comprar</a>
							</div>
						</div>
					</c:forEach>
					
					<c:forEach items="${promocionesNoFavoritas}" var="promocion">
						<div class="carousel-item">
							<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Promoci&oacute;n</h5>
								<p><c:out value="${promocion.getNombre()}"></c:out></p>
								<p>Costo: <c:out value="${promocion.getValorPromo()}"></c:out> monedas<br>
									Duraci&oacute;n: <c:out value="${promocion.getTiempoDeUso()}"></c:out> hora/s</p>
								<a href="#" class="btn btn-lg btn-primary excepciona">Comprar</a>
							</div>
						</div>
					</c:forEach>
					
					<c:forEach items="${atraccionesNoFavoritas}" var="atraccionN">
						<div class="carousel-item">
							<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5><c:out value="${atraccionN.getNombre()}"></c:out></h5>
								<p>Costo: <c:out value="${atraccionN.getValor()}"></c:out> monedas<br>
									Duraci&oacute;n: <c:out value="${atraccionN.getTiempoDeUso()}"></c:out> hora/s</p>
								<a href="#" class="btn btn-lg btn-primary excepciona">Comprar</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		
	<!-- modales. Deberian ir en un .jsp externo e importarlo con un partial (jsp:include) -->
	<!-- es como se me ocurrio la pantalla de compra de atraccion/promocion, pero si es muy dificil
		generarlo automaticamente se puede hacer de otra manera -->
	
		<div class="modal" tabindex="-1" id="promocion1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Promoción 1</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Atracciones: <br>
							Precio: <br> 
							Tiempo:<br></p>
						<button type="button" class="btn btn-primary">Comprar</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal" tabindex="-1" id="atraccion1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Atracción 1</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Precio: <br> 
							Tiempo:<br></p>
						<button type="button" class="btn btn-primary">Comprar</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>