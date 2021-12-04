<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar</title>

<jsp:include page="../../partials/view-head.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="../../partials/view-nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="modificar.jsp">Modificar</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="ver.jsp">Ver</a></li>
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
				      <div class="accordion-body bodyacordeon">
				      	<form method="post">
				      		<label for="nuevo_tipo">Ingrese un nuevo tipo de atracción:</label>
				      			<input type="text" name="nuevo_tipo" id="nuevo_tipo" required><br>
				      		<input type="submit">
				      	</form>
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
			      <div class="accordion-body bodyacordeon">
			      		<form method="post">
				      		<label for="nombre_atraccion">Nombre:</label>
				      			<input type="text" name="nombre_atraccion" id="nombre_atraccion" required><br>
				      			<label for="seleccion_tipo_atraccion">Seleccione el tipo de atracción:</label>
				      			<select name="seleccion_tipo_atraccion" id="seleccion_tipo_atraccion" required>
		<!-- extraer tipos de atraccion de bdd -->
									<option value="" selected disabled>Tipos:</option>
				      				<option value="aventura">Aventura</option>
				      				<option value="degustacion">Degustación</option>
				      				<option value="paisaje">Paisaje</option>
				      			</select><br>
				      		<label for="valor_atraccion">Valor:</label>
				      			<input type="number" name="valor_atraccion" id="valor_atraccion" min=0 required><br>
				      		<label for="tiempo_atraccion">Duración:</label>
				      			<input type="number" name="tiempo_atraccion" id="tiempo_atraccion" min=0 step=0.1 required><br>
				      		<label for="cupos_atraccion">Cupos:</label>
				      			<input type="number" name="cupos_atraccion" id="cupos_atraccion" min=0 required><br>
				      		<input type="submit" value="Aceptar">
				      	</form>
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
			      <div class="accordion-body bodyacordeon">
			      		<form method="post">
				      		<label for="tipo_promo">Tipo de promoción:</label>
				      			<select name="tipo_promo" id="tipo_promo" required>
		<!-- opciones deberian ser sacadas de bdd -->
		<!-- input de valor/descuento deberia aparecer al seleccionarse la opcion -->
									<option value="" selected disabled>Tipos:</option>
				      				<option value="porcentual">Porcentual</option>
				      				<option value="axb">AxB</option>
				      				<option value="absoluta">Absoluta</option>
				      			</select><br>
				      		<label for="atr1_promo">Atracción 1:</label>
				      			<select name="atr1_promo" id="atr1_promo" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      			</select><br>
				      		<label for="atr2_promo">Atracción 2:</label>
				      			<select name="atr2_promo" id="atr2_promo" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      			</select><br>
				      		<label for="atr3_promo">Atracción 3:</label>
				      			<select name="atr3_promo" id="atr3_promo">
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<option value="ninguna">Ninguna</option>
				      			</select><br>
				      	</form>
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
			      <div class="accordion-body bodyacordeon">
			      		<form method="post">
				      		<label for="nombre_usuario">Nombre:</label>
				      			<input type="text" name="nombre_usuario" id="nombre_usuario"><br>
				      		<label for="favorito_usuario">Tipo de atracción favorito:</label>
				      			<select name="favorito_usuario" id="favorito_usuario" required>
		<!-- extraer tipos de atraccion de bdd -->
									<option value="" selected disabled>Tipos:</option>
				      				<option value="aventura">Aventura</option>
				      				<option value="degustacion">Degustación</option>
				      				<option value="paisaje">Paisaje</option>
				      			</select><br>
				      		<label for="monedas_usuario">Monedas:</label>
				      			<input type="number" name="monedas_usuario" id="monedas_usuario" min=0 required><br>
				      		<label for="tiempo_usuario">Tiempo disponible:</label>
				      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" min=0 step=0.1 required>
				      	</form>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>

</body>
</html>