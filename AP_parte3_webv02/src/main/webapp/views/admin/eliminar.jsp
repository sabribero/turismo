<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<jsp:include page="../../partials/head.jsp"></jsp:include>

</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>
	
	<div class="container contenedor" style="color: black;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/views/admin/admin.jsp">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/modificar.do">Modificar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/agregar.do">Agregar</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/administrador/ver.do">Ver</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Eliminar</a></li>
		</ul>
		<header class="headercentrado">
							<div class="headercentrado">
				<h1>Bienvenido <c:out value="${user.nombre}" />!</h1>
				<br>
				</div>
			<p>Seleccione una de las siguientes opciones:</p>
		</header>
		<main class="contenido">
			<div class="accordion accordion-flush" id="accordionFlushExample">

			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed botonacordeon" id="tipos_de_atraccion" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        Tipos de Atracci&oacute;n
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body bodyacordeon">
				      <div class="alert alert-danger">
								<strong>ADVERTENCIA: Borrar un tipo de atracci&oacute;n har&aacute; que no aparezcan los usuarios, atracciones y promociones que lo utilicen.</strong>
						</div>
				      	<form action="/AP_parte3_webv02/tipos/delete.do">
				      		<label for="seleccion_tipo">Seleccione un tipo para eliminar:</label>
				      			<select name="seleccion_tipo" id="seleccion_tipo" required>
				      				<option value="" selected disabled>Tipos:</option>
				      				<c:forEach items="${tiposDeAtraccion}" var="tipoDeAtraccion">
				      					<option value="${tipoDeAtraccion.getNombre()}"><c:out value="${tipoDeAtraccion.getNombre()}"></c:out></option>
				      				</c:forEach>
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
			      		<form action="/AP_parte3_webv02/attractions/delete.do">
				      		<label for="atraccion_eliminar">Seleccione una atracci&oacute;n para eliminar:</label>
				      			<select name="atraccion_eliminar" id="atraccion_eliminar" required>
				      				<option value="" selected disabled>Atracciones:</option>
				      				<c:forEach items="${attractions}" var="atraccion">
				      					<option value="${atraccion.nombre}"><c:out value="${atraccion.nombre}"></c:out></option>
				      				</c:forEach>
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
			      		<form action="/AP_parte3_webv02/promociones/delete.do">
				      		<label for="seleccion_promo">Seleccione una promoci&oacute;n para eliminar:</label>
				      			<select name="seleccion_promo" id="seleccion_promo" required>
				      				<option value="" selected disabled>Cada promoci&oacute;n</option>
				      				<c:forEach items="${promociones}" var="promocion">
				      					<option value="${promocion.getNombre()}"><c:out value="${promocion.getClass().getSimpleName().replace('Promo', '')}"></c:out>, 
				      					<c:out value="${promocion.getNombre()}"></c:out></option>
				      				</c:forEach>
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
			      		<form action="/AP_parte3_webv02/usuarios/delete.do">
		<!-- usuarios de bdd -->
				      		<label for="usuario_eliminar">Seleccione un usuario para eliminar:</label>
				      			<select name="usuario_eliminar" id="usuario_eliminar" required>
				      				<option value="" selected disabled>Todos los usuarios</option>
				      				<c:forEach items="${usuarios}" var="usuario">
			      						<option value="${usuario.getNombre()}"><c:out value="${usuario.getNombre()}"></c:out></option>
			      					</c:forEach>
				      			</select><br>
				      			<input type="submit" value="Eliminar">
				      	</form>
			      </div>
			    </div>
			  </div>
			</div>
		</main>
	</div>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>
</body>
</html>