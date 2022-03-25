<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/tiposdeatraccion.do">Tipos de atracci&oacute;n</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Atracciones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/promociones.do">Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/usuarios.do">Usuarios</a></li>
		</ul>
		<header class="headercentrado">
			<div class="headercentrado">
				<h1>Atracciones</h1>
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
				aria-expanded="false" aria-controls="addcolapsable">Agregar nueva atracci&oacute;n</a>
				<!-- COLAPSABLE -->
				<div class="collapse collapse-horizontal" id="addcolapsable">
					<form action="/turismo_webapp/attractions/create.do" method="post" class="adminform">
				      		<label for="nombre_atraccion">Nombre:</label>
				      			<input type="text" name="nombre_atraccion" id="nombre_atraccion" class="form-control" required><br>
				      		<label for="seleccion_tipo_atraccion">Seleccione el tipo de atracción:</label>
				      			<select name="seleccion_tipo_atraccion" id="seleccion_tipo_atraccion" class="form-select" required>
									<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="valor_atraccion">Valor:</label>
				      			<input type="number" name="valor_atraccion" id="valor_atraccion" class="form-control" min=0 required><br>
				      		<label for="tiempo_atraccion">Duraci&oacute;n:</label>
				      			<input type="number" name="tiempo_atraccion" id="tiempo_atraccion" class="form-control" min=0 step=0.5 required><br>
				      		<label for="cupos_atraccion">Cupos:</label>
				      			<input type="number" name="cupos_atraccion" id="cupos_atraccion" class="form-control" min=0 required><br>
				      		<input type="submit" class="btn btn-success rounded excepciona" value="Crear">
				      	</form>
				</div>
		<table class="table table-stripped table-hover">
			<thead>
				<tr>
					<th>Atracci&oacute;n</th>
					<th>Tipo</th>
					<th>Valor</th>
					<th>Duraci&oacute;n</th>
					<th>Cupos</th>
					<th>Acci&oacute;n</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${atracciones}" var="atraccion">
						<tr>
							<td><c:out value="${atraccion.getNombre()}"></c:out></td>
							<td><c:out value="${atraccion.getNombreTipo()}"></c:out></td>
							<td><c:out value="${atraccion.getValor()}"></c:out></td>
							<td><c:out value="${atraccion.getTiempoDeUso()}"></c:out></td>
							<td><c:out value="${atraccion.getUsosDisponibles()}"></c:out></td>
							<td><a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#editcolapsable${atraccion.getNombre().replace(' ', '')}"
									aria-expanded="false" aria-controls="editcolapsable${atraccion.getNombre()}">Editar</a>
								<a href="/turismo_webapp/attractions/delete.do?atraccion_eliminar=${atraccion.getNombre()}"
									class="btn btn-danger excepciona" role="button">Eliminar</a>
							</td>
							
						</tr>
						<!-- COLAPSABLE -->
						 <tr>
            				<td colspan="12" class="hiddenRow">
								<div class="collapse collapse-horizontal" id="editcolapsable${atraccion.getNombre().replace(' ', '')}">
									<form action="/turismo_webapp/attractions/edit.do" method="post">
										<input type="hidden" name="seleccion_atraccion" value="${atraccion.getNombre()}">
										<label for="seleccion_tipo_atraccion">Seleccione el tipo de atracción:</label>
						      			<select name="seleccion_tipo_atraccion" id="seleccion_tipo_atraccion" class="form-select" required>
						      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
						      					<option value="${tipoDeAtraccion.getNombre()}" ${atraccion.getNombreTipo() == tipoDeAtraccion.getNombre() ? "selected" : ""}><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
						      				</c:forEach>
						      			</select><br>
							      		<label for="valor_atraccion">Valor:</label>
							      			<input type="number" name="valor_atraccion" id="valor_atraccion" class="form-control" min=0 value="${atraccion.getValor()}" required><br>
							      		<label for="tiempo_atraccion">Duraci&oacute;n:</label>
							      			<input type="number" name="tiempo_atraccion" id="tiempo_atraccion" class="form-control" min=0 step=0.5 value="${atraccion.getTiempoDeUso()}" required><br>
							      		<label for="cupos_atraccion">Cupos:</label>
							      			<input type="number" name="cupos_atraccion" id="cupos_atraccion" class="form-control" min=0 value="${atraccion.getUsosDisponibles()}" required><br>
											
										<button type="submit" class="btn btn-primary excepciona">Guardar</button>
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