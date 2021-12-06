<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="modificar.jsp">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="agregar.jsp">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="ver.jsp">Ver</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Eliminar</a></li>
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
				      		<label for="seleccion_tipo">Seleccione un tipo para eliminar:</label>
		<!-- los tipos deberian salir de la bdd -->
				      			<select name="seleccion_tipo" id="seleccion_tipo" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<option value="aventura">Aventura</option>
				      				<option value="degustacion">DegustaciÃ³n</option>
				      				<option value="paisaje">Paisaje</option>
				      			</select><br>
				      			<input type="submit" value="Eliminar">
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
		<!-- atracciones de bdd -->
				      		<label for="atraccion_eliminar">Seleccione una atracción para eliminar:</label>
				      			<select name="atraccion_eliminar" id="atraccion_eliminar" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      			</select><br>
				      			<input type="submit" value="Eliminar">
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
				      		<label for="seleccion_promo">Seleccione una promoción para eliminar:</label>
		<!-- cada promocion puede estar representada como Tipo, Valor, Atraccion1, Atraccion2, Atraccion3 -->
				      			<select name="seleccion_promo" id="seleccion_promo">
		<!-- extraer promociones de bdd -->
				      				<option value="" selected disabled>Cada promoción</option>
				      			</select><br>
				      			<input type="submit" value="Eliminar">
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
		<!-- usuarios de bdd -->
				      		<label for="usuario_eliminar">Seleccione un usuario para eliminar:</label>
				      			<select name="usuario_eliminar" id="usuario_eliminar" required>
				      				<option value="" selected disabled>Todos los usuarios</option>
				      			</select><br>
				      			<input type="submit" value="Eliminar">
				      	</form>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>
</body>
</html>