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
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page"  href="#">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/agregar.do">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/ver.do">Ver</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/eliminar.do">Eliminar</a></li>
		</ul>
		<header class="headercentrado">
							<div class="headercentrado">
				<h1>Bienvenido <c:out value="${user.nombre}" />!</h1>
				<br>
				</div>
				<p>Seleccione una de las siguientes opciones:</p>
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
			<div class="accordion accordion-flush" id="accordionFlushExample">

			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed botonacordeon" id="tipos_de_atraccion" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        Tipos de Atracci&oacute;n
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body bodyacordeon">
				      	<form action="/AP_parte3_webv02/tipos/edit.do" method="post">
				      		<label for="seleccion_tipo">Seleccione un tipo para modificar:</label>
				      			<select name="seleccion_tipo" id="seleccion_tipo" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="nombre_tipo">Modifique el nombre:</label>
				      			<input type="text" name="nombre_tipo" id="nombre_tipo" required><br>
				      		<label></label>
				      			<input type="submit" value="Aceptar">
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
			      		<form action="/AP_parte3_webv02/attractions/edit.do" method="post">
				      		<label for="seleccion_atraccion">Seleccione una atracci&oacute;n para modificar:</label>
				      			<select name="seleccion_atraccion" id="seleccion_atraccion" required>
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
			      		<form action="/AP_parte3_webv02/promociones/edit.do" method="post">
		<!-- cada promocion puede estar representada como Tipo, Valor, Atraccion1, Atraccion2, Atraccion3 -->
				      		<label for="seleccion_promo">Seleccione una promoción para modificar:</label>
				      			<select name="seleccion_promo" id="seleccion_promo" required>
		<!-- extraer promociones de bdd -->
				      				<option value="" selected disabled>Cada promoción</option>
				      				<c:forEach items="${promociones}" var="promocion">
				      					<option value="${promocion.getNombre()}"><c:out value="${promocion.getClass().getSimpleName().replace('Promo', '')}"></c:out>, 
				      					<c:out value="${promocion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				     		<label for="valor_promo">Valor de promoci&oacute;n: (Si la promoci&oacute;n es AxB el valor se desestima)</label>
				     			<input type="number" name="valor_promo" id="valor_promo" min=0 required><br>
		<!-- aca tambien idealmente se traerian las atracciones que ya estan por default -->
							<label for="seleccion_atr1_promo">Atracci&oacute;n 1:</label>
				      			<select name="seleccion_atr1_promo" id="seleccion_atr1_promo" required>
				      				<option value="" selected disabled>Cada atracci&oacute;n</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="seleccion_atr2_promo">Atracci&oacute;n 2:</label>
				      			<select name="seleccion_atr2_promo" id="seleccion_atr2_promo" required>
				      				<option value="" selected disabled>Cada atracci&oacute;n</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="seleccion_atr3_promo">Atracci&oacute;n 3:</label>
				      			<select name="seleccion_atr3_promo" id="seleccion_atr3_promo" required>
				      				<option value="" selected disabled>Cada atracci&oacute;n</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      				<option value="-">-</option>
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
			      		<form action="/AP_parte3_webv02/usuarios/edit.do" method="post">
			      		<label for="seleccion_usuario">Seleccione un usuario al que modificar:</label>
			      			<select name="seleccion_usuario" id="seleccion_usuario" required>
			      				<option value="" selected disabled>Todos los usuarios</option>
			      				<c:forEach items="${usuarios}" var="usuario">
			      					<option value="${usuario.getNombre()}"><c:out value="${usuario.getNombre()}"></c:out></option>
			      				</c:forEach>
			      			</select><br>
		<!-- los valores default deberian cargarse desde la bdd -->
				      		<label for="nombre_usuario">Nombre:</label>
				      			<input type="text" name="nombre_usuario" id="nombre_usuario" required><br>
				      		<label for="password_usuario">Contrase&ntilde;a:</label>
				      			<input type="password" name="password_usuario" id="password_usuario" required><br>
				      		<label for="seleccion_favorito_usuario">Seleccione un tipo de atracción favorito:</label>
				      			<select name="seleccion_favorito_usuario" id="seleccion_favorito_usuario" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="dinero_usuario">Monedas:</label>
				      			<input type="number" name="dinero_usuario" id="dinero_usuario" min=0 required><br>
				      		<label for="tiempo_usuario">Tiempo disponible:</label>
				      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" min=0 step=0.5 required><br>
				      		<p>Es administrador:</p>
				      			<input type="radio" name="admin_usuario" id="no" value="no" checked>
				      		<label for="no">No</label>
				      			<input type="radio" name="admin_usuario" id="si" value="si">
				      		<label for="si">Si</label>
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