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
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/tiposdeatraccion.do">Tipos de atracci&oacute;n</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/atracciones.do">Atracciones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/promociones.do">Promociones</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Usuarios</a></li>
		</ul>
		<header class="headercentrado">
			<h1>Usuarios</h1>
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
				aria-expanded="false" aria-controls="addcolapsable">Agregar nuevo Usuario</a>
				<!-- COLAPSABLE -->
				<div class="collapse collapse-horizontal" id="addcolapsable">
					<form action="/turismo_webapp/usuarios/create.do" method="post" class="adminform">
				      		<label for="nombre_usuario">Nombre:</label>
				      			<input type="text" name="nombre_usuario" id="nombre_usuario" class="form-control" required><br>
				      		<label for="password_usuario">Contrase&ntilde;a:</label>
				      			<input type="password" name="password_usuario" id="password_usuario" class="form-control" required><br>
				      		<label for="favorito_usuario">Tipo de atracción favorito:</label>
				      			<select name="favorito_usuario" id="favorito_usuario" class="form-select" required>
									<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="monedas_usuario">Monedas:</label>
				      			<input type="number" name="monedas_usuario" id="monedas_usuario" class="form-control" min=0 required><br>
				      		<label for="tiempo_usuario">Tiempo disponible:</label>
				      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" class="form-control" min=0 step=0.5 required>
				      		<br>
				      		<p>Es administrador:</p>
				      				<input type="radio" name="admin_usuario" id="no" value="no" checked>
				      			<label for="no">No</label>
				      				<input type="radio" name="admin_usuario" id="si" value="si">
				      			<label for="si">S&iacute;</label>
				      		<br>
				      		<input type="submit" class="btn btn-success rounded excepciona" value="Crear">
				      	</form>
				</div>
				<table class="table table-hover">
				      		<thead>
				      			<tr>
				      				<th class="col-2">Nombre</th>
				      				<th class="col-2">Tipo preferido</th>
				      				<th class="col-2">Dinero</th>
				      				<th class="col-2">Tiempo disponible</th>
				      				<th class="col-2">Es Admin</th>
				      				<th class="col-2">Acci&oacute;n</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<c:forEach items="${usuarios}" var="usuario">
					      			<tr>
					      				<td>${usuario.getNombre()}</td>
					      				<td>${usuario.getNombreAtraccionFavorita()}</td>
					      				<td>${usuario.getPresupuesto()}</td>
					      				<td>${usuario.getTiempoDisponible()}</td>
					      				<td><c:if test="${usuario.getEsAdmin()}">
												S&iacute;
											</c:if>
											<c:if test="${!usuario.getEsAdmin()}">
												No
											</c:if>
										</td>
					      				<td><a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#editcolapsable${usuario.getNombre().replace(' ', '')}"
												aria-expanded="false" aria-controls="editcolapsable${usuario.getNombre().replace(' ', '')}">Editar</a>
											<a href="/turismo_webapp/usuarios/delete.do?usuario_eliminar=${usuario.getNombre().replace(' ', '%20')}"
												class="btn btn-danger excepciona" role="button">Eliminar</a>
										</td>
					      			</tr>
					      			<!-- COLAPSABLE -->
									 <tr>
			            				<td colspan="12" class="hiddenRow">
											<div class="collapse collapse-horizontal" id="editcolapsable${usuario.getNombre().replace(' ', '')}">
												<form action="/turismo_webapp/usuarios/edit.do" method="post" class="adminform">
										      			<input type="hidden" name="seleccion_usuario" value="${usuario.getId()}">
										      		<label for="password_usuario">Contrase&ntilde;a:</label>
										      			<input type="password" name="password_usuario" id="password_usuario" class="form-control" required><br>
										      		<label for="seleccion_favorito_usuario">Tipo de atracción favorito:</label>
										      			<select name="seleccion_favorito_usuario" id="seleccion_favorito_usuario" class="form-select" required>
															<option value="" selected disabled>Tipo:</option>
										      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
										      					<option value="${tipoDeAtraccion.getNombre()}" ${tipoDeAtraccion.getNombre()==usuario.getNombreAtraccionFavorita() ? "selected" : ""}><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
										      				</c:forEach>
										      			</select><br>
										      		<label for="dinero_usuario">Monedas:</label>
										      			<input type="number" name="dinero_usuario" id="dinero_usuario" class="form-control" min=0 value="${usuario.getPresupuesto()}" required><br>
										      		<label for="tiempo_usuario">Tiempo disponible:</label>
										      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" class="form-control" min=0 step=0.5 value="${usuario.getTiempoDisponible()}" required>
										      		<br>
										      		<p>Es administrador:</p>
										      				<input type="radio" name="admin_usuario" id="no" value="no" ${!usuario.getEsAdmin() ? "checked" : ""}>
										      			<label for="no">No</label>
										      				<input type="radio" name="admin_usuario" id="si" value="si" ${usuario.getEsAdmin() ? "checked" : ""}>
										      			<label for="si">S&iacute;</label>
										      		<br>
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