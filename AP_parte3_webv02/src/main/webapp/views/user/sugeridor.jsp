<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Obtener sugerencias</title>

<jsp:include page="../../partials/view-head.jsp"></jsp:include>

</head>
<body>
	
	<jsp:include page="../../partials/view-nav.jsp"></jsp:include>

	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="itinerario.jsp">Mi Itinerario</a></li>
		</ul>
	
	<!-- el container se puede cambiar para que ocupe mas o menos espacio -->
		<div class="contenido contenidocarousel">
			<div id="carouselExampleCaptions" class="carousel carousel-dark slide" data-bs-interval="false">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" 
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Promoción 1</h5>
							<p>Atracciones: La Comarca, Lothlorien <br>
								Costo: 20 monedas <br>
								Duración: 3.5 hs</p>
							<a href="#" class="btn btn-lg btn-primary excepciona" data-bs-toggle="modal" data-bs-target="#promocion1">Ver detalle</a>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Atracción 1</h5>
							<p>Costo: 10 monedas<br>
								Duración: 1 hora</p>
							<a href="#" class="btn btn-lg btn-primary excepciona" data-bs-toggle="modal" data-bs-target="#atraccion1">Ver detalle</a>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://http2.mlstatic.com/D_NQ_NP_947787-MLA43560609530_092020-O.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Promoción 2</h5>
							<p>Atracciones: x, y <br>
								Costo: 22 monedas<br>
								Duración:4 horas</p>
	<!-- boton deshabilitado para cuando el usuario no tenga mas dinero o tiempo -->
							<a class="btn btn-lg btn-primary disabled" aria-disabled="true">Ver detalle</a>
						</div>
					</div>
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