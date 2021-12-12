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
<body>
	
	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/user/ofertador.do">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Mi Itinerario</a></li>
		</ul>
		
		
		Este es tu itinerario, "${user.nombre}"
		

		
		<div class="contenido">
			<table class="table table-hover">
				<thead class="table-dark">
					<tr>
						<th class="col-1">Elemento</th>
						<th class="col-2">Atracción/es</th>
						<th class="col-2">Costo</th>
						<th class="col-2">Tiempo</th>
					</tr>
				</thead>
				<tbody>
				
				
				
				
				
				
					<c:forEach items="${attractions}" var="atraccion">
						
									<tr>
						<td>1</td>
						<td><c:out value="${atraccion.nombre}"></c:out>
						<td>Costo: <c:out value="${atraccion.valor}"></c:out></td>
						<td>Costo: <c:out value="${atraccion.valor}"></c:out></td>
					</tr>		

			
				</c:forEach>
						
				<!-- 
						<div class="card col">
							<img src="https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title" id="${atraccion.nombre.replace(' ','')}"><c:out value="${atraccion.nombre}"></c:out></h5>
								<h6 class="card-text"><c:out value="${atraccion.tipo}"></c:out></h6>
								<p class="card-text">Costo: <c:out value="${atraccion.valor}"></c:out> monedas</p>
								<p class="card-text">Costo: <c:out value="${atraccion.valor}"></c:out> hora/s</p>
								<p class="card-text">Cupos: <c:out value="${atraccion.usosDisponibles}"></c:out></p>
							</div>
						</div>
						
						
						
						

				
				
				 -->		
						
				



				</tbody>
				<tfoot class="table-light">
					<tr>
						<td><b>Total</b></td>
						<td>&nbsp;</td>
						<td>25 monedas</td>
						<td>5 horas</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	
	
	
	

	
	
	
	
</body>
</html>