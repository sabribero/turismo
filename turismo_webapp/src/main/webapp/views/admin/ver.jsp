<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ver</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/modificar.do">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/agregar.do">Agregar</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ver</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/eliminar.do">Eliminar</a></li>
		</ul>
		<header class="headercentrado">
				<div class="headercentrado">
				<h1>Bienvenido <c:out value="${user.nombre}" />!</h1>
				<br>
				</div>
				
			<p>Seleccione una de las siguientes opciones:</p>
		</header>
		<main class="contenido">
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed botonacordeon" id="tipos_de_atraccion" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        Tipos de Atracción
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body container bodyacordeon">
				      	<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-6">Nombre</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      				<tr>
					      				<td><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></td>
				      				</tr>
					      		</c:forEach>
				      		</tbody>
				      	</table>
				      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingTwo">
			      <button class="accordion-button collapsed botonacordeon" id="atracciones" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        Atracciones
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body container bodyacordeon">
			      		<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-2">Nombre</th>
				      				<th class="col-2">Costo</th>
				      				<th class="col-2">Duración</th>
				      				<th class="col-2">Cupos</th>
				      				<th class="col-2">Tipo</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${attractions}" var="atraccion">
				      				<tr>
						      			<td><c:out value="${atraccion.nombre}"></c:out></td>
						      			<td><c:out value="${atraccion.valor}"></c:out> monedas</td>
						      			<td><c:out value="${atraccion.tiempoDeUso}"></c:out> hora/s</td>
						      			<td><c:out value="${atraccion.usosDisponibles}"></c:out></td>
						      			<td><c:out value="${atraccion.getTipo().getNombre()}"></c:out></td>
				      				</tr>
					      		</c:forEach>	
				      		</tbody>
				      	</table>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingThree">
			      <button class="accordion-button collapsed botonacordeon" id="promociones" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
			        Promociones
			      </button>
			    </h2>
			    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body container bodyacordeon">
			      		<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-2">Tipo de promoci&oacute;n</th>
				      				<th class="col-2">Precio</th>
				      				<th class="col-2">Duraci&oacute;n</th>
				      				<th class="col-2">Atracci&oacute;n 1</th>
				      				<th class="col-2">Atracci&oacute;n 2</th>
				      				<th class="col-2">Atracci&oacute;n 3</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${promociones}" var="promocion">
				      				<tr>
						      			<td><c:out value="${promocion.getClass().getSimpleName().replace('Promo', '')}"></c:out></td>
						      			<td><c:out value="${promocion.getValorPromo()}"></c:out> monedas</td>
						      			<td><c:out value="${promocion.getTiempoDeUso()}"></c:out> hora/s</td>
						      			<td><c:out value="${promocion.getAtraccionesEnPromocion().get(0)}"></c:out></td>
						      			<td><c:out value="${promocion.getAtraccionesEnPromocion().get(1)}"></c:out></td>
						      			<c:if test="${promocion.getAtraccionesEnPromocion().size()>2}">
						      				<td><c:out value="${promocion.getAtraccionesEnPromocion().get(2)}"></c:out></td>
						      			</c:if>
						      			<c:if test="${promocion.getAtraccionesEnPromocion().size()==2}">
						      				<td>-</td>
						      			</c:if>
				      				</tr>
					      		</c:forEach>
				      		</tbody>
				      	</table>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingFour">
			      <button class="accordion-button collapsed botonacordeon" id="usuarios" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
			        Usuarios
			      </button>
			    </h2>
			    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body container bodyacordeon">
			      		<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-2">Nombre</th>
				      				<th class="col-2">Tipo preferido</th>
				      				<th class="col-2">Dinero</th>
				      				<th class="col-2">Tiempo disponible</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${usuarios}" var="usuario">
					      			<tr>
					      				<td>${usuario.getNombre()}</td>
					      				<td>${usuario.getNombreAtraccionFavorita()}</td>
					      				<td>${usuario.getPresupuesto()}</td>
					      				<td>${usuario.getTiempoDisponible()}</td>
					      			</tr>
					      		</c:forEach>
				      		</tbody>
				      	</table>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>