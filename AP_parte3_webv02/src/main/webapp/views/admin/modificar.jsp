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
<body>

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page"  href="#">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/agregar.do">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/ver.do">Ver</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/eliminar.do">Eliminar</a></li>
		</ul>
		<header class="headercentrado">
			<h1>BIENVENIDO ADMIN!</h1>
				<p>Seleccione una de las siguientes opciones:</p>
		</header>
		<main class="contenido">
			<div class="accordion accordion-flush" id="accordionFlushExample">
<!-- comentado porque no conviene modificar tipos de atraccion
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed botonacordeon" id="tipos_de_atraccion" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        Tipos de Atracci&oacute;n
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body bodyacordeon">
				      	<form method="post">
				      		<label for="seleccion_tipo">Seleccione un tipo para modificar:</label>
				      			<select name="seleccion_tipo" id="seleccion_tipo" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion}"><c:out value="${tipoDeAtraccion}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="nombre_tipo">Modifique el nombre:</label>
				      			<input type="text" name="nombre_tipo" id="nombre_tipo" required><br>
				      		<label></label>
				      			<input type="submit" value="Aceptar">
				      	</form>
				      </div>
			    </div>
			  </div>  -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingTwo">
			      <button class="accordion-button collapsed botonacordeon" id="atracciones" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        Atracciones
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body bodyacordeon">
			      		<form action="/AP_parte3_webv02/attractions/edit.do" method="post">
				      		<label for="seleccion_atraccion">Seleccione una atracci&oacute;n para modificar:</label>
				      			<select name="seleccion_atraccion" id="seleccion_atraccion">
				      				<option value="" selected disabled>Cada atracci&oacute;n</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion}"><c:out value="${atraccion}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
		<!-- estaria bueno que los input trayeran en el value la informacion que YA hay en la base de datos -->
				      		<label for="valor_atraccion">Valor:</label>
				      			<input type="number" name="valor_atraccion" id="valor_atraccion" min=0 required><br>
				      		<label for="tiempo_atraccion">Duración:</label>
				      			<input type="number" name="tiempo_atraccion" id="tiempo_atraccion" min=0 step=0.5 required><br>
				      		<label for="cupos_atraccion">Cupos:</label>
				      			<input type="number" name="cupos_atraccion" id="cupos_atraccion" min=0 required><br>
		<!-- comentado porque quiza no esta bueno que puedan cambiar el tipo de atraccion, puede romper alguna promocion -->
				      		<!--<label for="seleccion_tipo_atraccion">Seleccione el tipo de atracción:</label>
				      			<select name="seleccion_tipo_atraccion" id="seleccion_tipo_atraccion" required>
									<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion}"><c:out value="${tipoDeAtraccion}"></c:out></option>
				      				</c:forEach>
				      			</select>-->
				      		<br>
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
		<!-- cada promocion puede estar representada como Tipo, Valor, Atraccion1, Atraccion2, Atraccion3 -->
				      		<label for="seleccion_promo">Seleccione una promoción para modificar:</label>
				      			<select name="seleccion_promo" id="seleccion_promo">
		<!-- extraer promociones de bdd -->
				      				<option value="" selected disabled>Cada promoción</option>
				      			</select><br>
				     		<label for="tipo_promo">Tipo de promoción:</label>
				     			<select name="tipo_promo" id="tipo_promo" required>
		<!-- un input de valor/descuento deberia aparecer solo cuando se abra la opcion correspondiente -->
									<option value="" selected disabled>Tipos:</option>
				     				<option value="axb">AxB</option>
				     				<option value="porcentual">Porcentual</option>
				     				<option value="absoluta">Absoluta</option>
				     			</select><br>
		<!-- aca tambien idealmente se traerian las atracciones que ya estan por default -->
							<label for="seleccion_atr1_promo">Atracción 1:</label>
				      			<select name="seleccion_atr1_promo" id="seleccion_atr1_promo" required>
				      				<option value="" selected disabled>Cada atracción</option>
				      			</select><br>
				      		<label for="seleccion_atr2_promo">Atracción 2:</label>
				      			<select name="seleccion_atr2_promo" id="seleccion_atr2_promo" required>
				      				<option value="" selected disabled>Cada atracción</option>
				      			</select><br>
				      		<label for="seleccion_atr3_promo">Atracción 3:</label>
				      			<select name="seleccion_atr3_promo" id="seleccion_atr3_promo">
				      				<option value="" selected disabled>Cada atracción</option>
				      				<option value="ninguna">Ninguna</option>
				      			</select><br>
				      		<input type="submit" value="Aceptar">
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
			      		<label for="seleccion_usuario">Seleccione un usuario al que modificar:</label>
			      			<select name="seleccion_usuario" id="seleccion_usuario">
			      				<option value="" selected disabled>Todos los usuarios</option>
			      			</select><br>
		<!-- los valores default deberian cargarse desde la bdd -->
				      		<label for="nombre_usuario">Nombre:</label>
				      			<input type="text" name="nombre_usuario" id="nombre_usuario" required><br>
				      		<label for="seleccion_favorito_usuario">Seleccione un tipo de atracción favorito:</label>
				      			<select name="seleccion_favorito_usuario" id="seleccion_favorito_usuario" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion}"><c:out value="${tipoDeAtraccion}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="dinero_usuario">Monedas:</label>
				      			<input type="number" name="dinero_usuario" id="dinero_usuario" min=0 required><br>
				      		<label for="tiempo_usuario">Tiempo disponible:</label>
				      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" min=0 step=0.1 required><br>
				      		<input type="submit" value="Aceptar">
				      	</form>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>
</body>
</html>