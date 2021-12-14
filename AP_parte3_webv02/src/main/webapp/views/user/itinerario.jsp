<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">
	
	<jsp:include page="../../partials/nav2.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/views/user/user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/user/ofertador.do">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Mi Itinerario</a></li>
		</ul>
		
		<h3>Mi Itinerario</h3>


		
		<div class="contenido">
			<table class="table table-hover">
				<thead class="table-dark">
					<tr>
						<th class="col-2">Atracci&oacute;n/es</th>
						<th class="col-2">Tiempo</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${attractions}" var="atraccion">
						<tr>
							<td><c:out value="${atraccion.nombre}"></c:out>
							<td><c:out value="${atraccion.getTiempoDeUso()}"></c:out> hora/s</td>
						</tr>
					</c:forEach>	

				</tbody>
				<tfoot class="table-light">
					<tr>
						<td><b>Total</b></td>
						<td><c:out value="${tiempoTotal}"></c:out> hora/s</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	
	
</body>
</html>