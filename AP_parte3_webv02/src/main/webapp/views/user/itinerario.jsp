<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<jsp:include page="../../partials/view-head.jsp"></jsp:include>

</head>
<body>
	
	<jsp:include page="../../partials/view-nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="user.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="sugeridor.jsp">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Mi Itinerario</a></li>
		</ul>
		
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
					<tr>
						<td>1</td>
						<td>Atraccion 1 <br> Atraccion 2</td>
						<td>20 monedas</td>
						<td>3 horas</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Atraccion 1</td>
						<td>5 monedas</td>
						<td>2 horas</td>
					</tr>
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