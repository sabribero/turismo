<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/modificar.do">Modificar</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Agregar</a></li>
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
				<p>Elemento agregado con &eacute;xito.</p>
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
				      	<form action="/AP_parte3_webv02/tipos/create.do" method="post">
				      		<label for="nuevo_tipo">Ingrese un nuevo tipo de atracción:</label>
				      			<input type="text" name="nuevo_tipo" id="nuevo_tipo" required><br>
				      		<input type="submit" value="Crear">
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
			      		<form action="/AP_parte3_webv02/attractions/create.do" method="post">
				      		<label for="nombre_atraccion">Nombre:</label>
				      			<input type="text" name="nombre_atraccion" id="nombre_atraccion" required><br>
				      			<label for="seleccion_tipo_atraccion">Seleccione el tipo de atracción:</label>
				      			<select name="seleccion_tipo_atraccion" id="seleccion_tipo_atraccion" required>
		<!-- extraer tipos de atraccion de bdd -->
									<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="valor_atraccion">Valor:</label>
				      			<input type="number" name="valor_atraccion" id="valor_atraccion" min=0 required><br>
				      		<label for="tiempo_atraccion">Duración:</label>
				      			<input type="number" name="tiempo_atraccion" id="tiempo_atraccion" min=0 step=0.5 required><br>
				      		<label for="cupos_atraccion">Cupos:</label>
				      			<input type="number" name="cupos_atraccion" id="cupos_atraccion" min=0 required><br>
				      		<input type="submit" value="Crear">
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
			      		<form action="/AP_parte3_webv02/promociones/create.do" method="post">
				      		<label for="tipo_promo">Tipo de promoci&oacute;n:</label>
				      			<select name="tipo_promo" id="tipo_promo" required>
		<!-- opciones deberian ser sacadas de bdd -->
									<option value="" selected disabled>Tipos:</option>
				      				<option value="ABSOLUTA">ABSOLUTA</option>
				      				<option value="PORCENTUAL">PORCENTUAL</option>
				      				<option value="AxB">AxB</option>
				      			</select><br>
				      		<label for="valor_promo">Ingrese el valor/descuento. Si ud. eligi&oacute; promocion AxB el valor se desestimar&aacute;</label>
				      			<input type="number" name="valor_promo" id="valor_promo" min=0 required> <br>
				      		<p>Seleccione las atracciones en promoci&oacute;n. Recuerde que deben ser del mismo tipo; 
				      		para m&aacute;s informaci&oacute;n <a href="/AP_parte3_webv02/administrador/ver.do" target="blank">consulte las atracciones</a></p><br>
				      		<label for="atr1_promo">Atracci&oacute;n 1:</label>
				      			<select name="atr1_promo" id="atr1_promo" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="atr2_promo">Atracci&oacute;n 2:</label>
				      			<select name="atr2_promo" id="atr2_promo" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="atr3_promo">Atracci&oacute;n 3:</label>
				      			<select name="atr3_promo" id="atr3_promo" required>
				      				<option value="" selected disabled>Todas las atracciones</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
				      				<option value="-">-</option>
				      			</select><br>
				      		<input type="submit" value="Crear">
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
			      		<form action="/AP_parte3_webv02/usuarios/create.do" method="post">
				      		<label for="nombre_usuario">Nombre:</label>
				      			<input type="text" name="nombre_usuario" id="nombre_usuario" required><br>
				      		<label for="password_usuario">Contrase&ntilde;a:</label>
				      			<input type="password" name="password_usuario" id="password_usuario" required><br>
				      		<label for="favorito_usuario">Tipo de atracción favorito:</label>
				      			<select name="favorito_usuario" id="favorito_usuario" required>
		<!-- extraer tipos de atraccion de bdd -->
									<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
				      			</select><br>
				      		<label for="monedas_usuario">Monedas:</label>
				      			<input type="number" name="monedas_usuario" id="monedas_usuario" min=0 required><br>
				      		<label for="tiempo_usuario">Tiempo disponible:</label>
				      			<input type="number" name="tiempo_usuario" id="tiempo_usuario" min=0 step=0.5 required>
				      		<br>
				      		<p>Es administrador:</p>
				      				<input type="radio" name="admin_usuario" id="no" value="no" checked>
				      			<label for="no">No</label>
				      				<input type="radio" name="admin_usuario" id="si" value="si">
				      			<label for="si">S&iacute;</label>
				      		<br>
				      		<input type="submit" value="Crear">
				      	</form>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>

</body>
</html>