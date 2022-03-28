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
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/tiposdeatraccion.do">Tipos de atracci&oacute;n</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/atracciones.do">Atracciones</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/usuarios.do">Usuarios</a></li>
		</ul>
		<header class="headercentrado">
				<div class="headercentrado">
					<h1>Promociones</h1>
				</div>
				
		</header>
		<main class="contenido">
			<c:if test="${flash != null && !flash.getErrors().isEmpty()}">
			<div class="alert alert-danger">
					<ul>
						<c:forEach items="${flash.getErrors()}" var="entry">
							<li><c:out value="${entry.getValue()}"></c:out></li>
						</c:forEach>
					</ul>
			</div>
		</c:if>
		<c:if test="${flash != null && flash.getErrors().isEmpty()}">
			<div class="alert alert-success">
				<p>Elemento agregado con &eacute;xito.</p>
			</div>
		</c:if>
		
		<a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#addcolapsable"
				aria-expanded="false" aria-controls="addcolapsable">Agregar nueva Promoci&oacute;n</a>
				<!-- COLAPSABLE -->
				<div class="collapse collapse-horizontal" id="addcolapsable">
					<form action="/turismo_webapp/promociones/create.do" method="post" class="adminform">
				      		<label for="tipo_promo">Tipo de promoci&oacute;n:</label>
				      			<select name="tipo_promo" id="tipo_promo" class="form-select" required>
									<option value="" selected disabled>Tipo:</option>
				      				<option value="ABSOLUTA">ABSOLUTA: lleve las atracciones por determinada cantidad de monedas.</option>
				      				<option value="PORCENTUAL">PORCENTUAL: lleve las atracciones con determinado porcentaje de descuento sobre el total.</option>
				      				<option value="AxB">AxB: lleve determinadas atracciones y la última es gratis.</option>
				      			</select><br>
				      		<label for="valor_promo">Ingrese el valor/%descuento. Si ud. eligi&oacute; promocion AxB el valor se desestimar&aacute;</label>
				      			<input type="number" name="valor_promo" id="valor_promo" class="form-control" min=0 value="${promocion.getValorPromo()}" required> <br>
				      		<p>Seleccione las atracciones en promoci&oacute;n. Recuerde que deben ser del mismo tipo; 
				      		para m&aacute;s informaci&oacute;n <a href="/turismo_webapp/administrador/atracciones.do" target="blank">consulte las atracciones</a>.</p><br>
				      		<label for="atr1_promo">Atracci&oacute;n 1:</label>
				      			<select name="atr1_promo" id="atr1_promo" class="form-select" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${atracciones}" var="atraccion">
				      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas">
				      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
				      					</option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="atr2_promo">Atracci&oacute;n 2:</label>
				      			<select name="atr2_promo" id="atr2_promo" class="form-select" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${atracciones}" var="atraccion">
				      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas">
				      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
				      					</option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="atr3_promo">Atracci&oacute;n 3:</label>
				      			<select name="atr3_promo" id="atr3_promo" class="form-select" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${atracciones}" var="atraccion">
				      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas">
				      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
				      					</option>
				      				</c:forEach>
				      				<option value="-">-</option>
				      			</select><br>
				      		<input type="submit" class="btn btn-success rounded excepciona" value="Crear">
				      	</form>
				</div>
						<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-2">Tipo de promoci&oacute;n</th>
				      				<th class="col-2">Atracci&oacute;n 1</th>
				      				<th class="col-2">Atracci&oacute;n 2</th>
				      				<th class="col-2">Atracci&oacute;n 3</th>
				      				<th class="col-2">Precio</th>
				      				<th class="col-2">Duraci&oacute;n</th>
				      				<th class="col-2">Acci&oacute;n</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${promociones}" var="promocion">
				      				<tr>
						      			<td><c:out value="${promocion.getClass().getSimpleName().replace('Promo', '')}"></c:out></td>
						      			<td><c:out value="${promocion.getAtraccionesEnPromocion().get(0)}"></c:out></td>
						      			<td><c:out value="${promocion.getAtraccionesEnPromocion().get(1)}"></c:out></td>
						      			<c:if test="${promocion.getAtraccionesEnPromocion().size()>2}">
						      				<td><c:out value="${promocion.getAtraccionesEnPromocion().get(2)}"></c:out></td>
						      			</c:if>
						      			<c:if test="${promocion.getAtraccionesEnPromocion().size()==2}">
						      				<td>-</td>
						      			</c:if>
						      			<td><c:out value="${promocion.getValorPromo()}"></c:out> monedas</td>
						      			<td><c:out value="${promocion.getTiempoDeUso()}"></c:out> hora/s</td>
						      			<td><a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#editcolapsable${promocion.getId()}"
												aria-expanded="false" aria-controls="editcolapsable${promocion.getId()}">Editar</a>
											<a href="/turismo_webapp/promociones/delete.do?seleccion_promo=${promocion.getId()}"
												class="btn btn-danger excepciona" role="button">Eliminar</a>
										</td>
				      				</tr>
				      				<!-- COLAPSABLE -->
									 <tr>
			            				<td colspan="12" class="hiddenRow">
											<div class="collapse collapse-horizontal" id="editcolapsable${promocion.getId()}">
												<form action="/turismo_webapp/promociones/edit.do" method="post" class="adminform">
														
														<input type="hidden" name="seleccion_promo" value="${promocion.getId()}">
											      		<label for="valor_promo">Ingrese el valor/%descuento. Si la promoci&oacute;n es AxB el valor se desestimar&aacute;</label>
											      			<input type="number" name="valor_promo" id="valor_promo" class="form-control" value="${promocion.getValorPromo()}" min=0 required> <br>
											      		<p>Seleccione las atracciones en promoci&oacute;n. Recuerde que deben ser del mismo tipo; 
											      		para m&aacute;s informaci&oacute;n <a href="/turismo_webapp/administrador/atracciones.do" target="blank">consulte las atracciones</a>.</p><br>
											      		<label for="seleccion_atr1_promo">Atracci&oacute;n 1:</label>
											      			<select name="seleccion_atr1_promo" id="seleccion_atr1_promo" class="form-select" required>
											      				<option value="" selected disabled>Todas las atracciones</option>
											      				<c:forEach items="${atracciones}" var="atraccion">
											      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas" ${promocion.atraccionesEnPromocion.get(0).getNombre() == atraccion.getNombre() ? "selected" : ""}>
											      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
											      					</option>
											      				</c:forEach>
											      			</select><br>
											      		<label for="seleccion_atr2_promo">Atracci&oacute;n 2:</label>
											      			<select name="seleccion_atr2_promo" id="seleccion_atr2_promo" class="form-select" required>
											      				<option value="" selected disabled>Todas las atracciones</option>
											      				<c:forEach items="${atracciones}" var="atraccion">
											      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas" ${promocion.atraccionesEnPromocion.get(1).getNombre() == atraccion.getNombre() ? "selected" : ""}>
											      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
											      					</option>
											      				</c:forEach>
											      			</select><br>
											      		<label for="seleccion_atr3_promo">Atracci&oacute;n 3:</label>
											      			<select name="seleccion_atr3_promo" id="seleccion_atr3_promo" class="form-select" required>
											      				<option value="" selected disabled>Todas las atracciones</option>
											      				<c:forEach items="${atracciones}" var="atraccion">
											      					<option value="${atraccion.nombre}" title="Costo: ${atraccion.getValor()} monedas, Duracion: ${atraccion.getTiempoDeUso()} horas" ${promocion.atraccionesEnPromocion.size() > 2 ? (promocion.atraccionesEnPromocion.get(2).getNombre() == atraccion.getNombre() ? "selected" : "") : ""}>
											      					<c:out value="${atraccion.nombre}  [${atraccion.getNombreTipo()}]"></c:out>
											      					</option>
											      				</c:forEach>
											      				<option value="-">-</option>
											      			</select><br>
											      		<input type="submit" class="btn btn-success rounded excepciona" value="Guardar">
											      	</form>
												</div>
											</td>
									</tr>
					      		</c:forEach>
				      		</tbody>
				      	</table>
		</main>
	</div>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>