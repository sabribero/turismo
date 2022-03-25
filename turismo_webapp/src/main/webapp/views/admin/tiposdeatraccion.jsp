<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modificar</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page"  href="#">Tipos de atracci&oacute;n</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/atracciones.do">Atracciones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/promociones.do">Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/turismo_webapp/administrador/usuarios.do">Usuarios</a></li>
		</ul>
		<header class="headercentrado">
			<h1>Tipos de atracci&oacute;n</h1>
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
					<p>Modificaci&oacute;n realizada con &eacute;xito.</p>
				</div>
			</c:if>
			<a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#addcolapsable"
				aria-expanded="false" aria-controls="addcolapsable">Agregar nuevo tipo de atracci&oacute;n</a>
				<!-- COLAPSABLE -->
				<div class="collapse collapse-horizontal" id="addcolapsable">
					<form action="/turismo_webapp/tipos/create.do" method="post">
						<label for="nombre_tipo">Nombre del tipo de Atraccion:</label>
						<input type="text" name="nombre_tipo" id="nombre_tipo">
									
						<button type="submit" class="btn btn-primary excepciona">Guardar</button>
					 </form>
				</div>
			
			<div class="alert alert-danger" role="alert">
			  <strong>Advertencia: Eliminar un Tipo de atracci&oacute;n har&aacute; que se dejen de estar disponibles los
			  usuarios y atracciones que lo contengan.</strong>
			</div>
			<table class="table table-stripped table-hover">
				<thead>
					<tr>
						<th>Tipo de Atraccion</th>
						<th>Acci&oacute;n</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tiposDeAtraccion}" var="tipo">
						<tr>
							<td><c:out value="${tipo.getNombre()}"></c:out></td>
							<td><a class="btn btn-primary excepciona" role="button" data-bs-toggle="collapse" href="#editcolapsable${tipo.getNombre()}"
									aria-expanded="false" aria-controls="editcolapsable${tipo.getNombre()}">Editar</a>
								<a href="/turismo_webapp/tipos/delete.do?nombre_tipo=${tipo.getNombre()}"
									class="btn btn-danger excepciona" role="button">Eliminar</a>
							</td>
							
						</tr>
						<!-- COLAPSABLE -->
						 <tr>
            				<td colspan="12" class="hiddenRow">
							<div class="collapse collapse-horizontal" id="editcolapsable${tipo.getNombre()}">
								<form action="/turismo_webapp/tipos/edit.do" method="post">
									<input type="hidden" name="seleccion_tipo" value="${tipo.getNombre()}">
									<label for="nombre_tipo">Nombre del tipo de Atraccion:</label>
									<input type="text" name="nombre_tipo" id="nombre_tipo" value="${tipo.getNombre()}">
									
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