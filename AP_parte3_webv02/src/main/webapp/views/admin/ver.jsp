<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ver</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="modificar.jsp">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/agregar.do">Agregar</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ver</a></li>
			<li class="nav-item"><a class="nav-link" href="eliminar.jsp">Eliminar</a></li>
		</ul>
		<header class="headercentrado">
			<h1>BIENVENIDO ADMIN!</h1>
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
				      				<th class="col-3">ID</th>
				      				<th class="col-6">Nombre</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<tr>
				      				<td>1</td>
				      				<td>Tipos sacados de bdd</td>
				      			</tr>
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
				      				<th class="col-1">ID</th>
				      				<th class="col-2">Nombre</th>
				      				<th class="col-2">Costo</th>
				      				<th class="col-2">Duración</th>
				      				<th class="col-2">Cupos</th>
				      				<th class="col-2">Tipo</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<tr>
				      				<td>1</td>
				      				<td>Atraccion1</td>
				      				<td>5 monedas</td>
				      				<td>2 horas</td>
				      				<td>30</td>
				      				<td>Aventura</td>
				      			</tr>
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
				      				<th class="col-1">ID</th>
				      				<th class="col-2">Tipo de promociÃ³n</th>
				      				<th class="col-2">Precio/Descuento</th>
				      				<th class="col-2">Atracción 1</th>
				      				<th class="col-2">Atracción 2</th>
				      				<th class="col-2">Atracción 3</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<tr>
				      				<td>1</td>
				      				<td>AxB</td>
				      				<td>0</td>
				      				<td>Lothlorien</td>
				      				<td>La Comarca</td>
				      				<td>&nbsp;</td>
				      			</tr>
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
				      				<th class="col-1">ID</th>
				      				<th class="col-2">Nombre</th>
				      				<th class="col-2">Tipo preferido</th>
				      				<th class="col-2">Dinero</th>
				      				<th class="col-2">Tiempo disponible</th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      			<tr>
				      				<td>1</td>
				      				<td>Un nombre</td>
				      				<td>Aventura</td>
				      				<td>15 monedas</td>
				      				<td>15 horas</td>
				      			</tr>
				      		</tbody>
				      	</table>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>
</body>
</html>