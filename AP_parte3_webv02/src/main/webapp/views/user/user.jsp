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
		<ul class="nav nav-tabs nav-fill nav-dark">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/user/ofertador.do">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/itinerario.do">Mi Itinerario</a></li>
		</ul>
		 <header class="headercentrado"> 

		¡Bienvenido, <c:out value="${user.nombre}" />!
		<br>
		
			<div class="container">
				<div class="row align-items-start excepciona">
					<a href="/AP_parte3_webv02/apisServlets/clima" class="btn btn-primary btn-lg">Clima</a>
				</div>
			</div>
		Actualmente en la tierra media: <c:out value="${clima.getTemperatura}" />
									
										
	
			<ul class="centrado recuadro">
					<li>* Tu <a href="itinerario.jsp">itinerario</a> actual cuenta con X atracciones.</li>
					<li>* Has gastado X cantidad de monedas. </li>
					<li>* Vas a pasar X horas en tierra media.</li>
					<li>* Te quedan <c:out value="${user.presupuesto}" /> monedas.</li>
					<li>* Te quedan <c:out value="${user.tiempoDisponible}" /> horas libres.</li>
					<li>* <a href="/AP_parte3_webv02/cambiarpass.jsp"> Cambiar contraseña</a></li> 
			</ul>
	</header> 
	
	

		<div class="contenido">
			<h2>¿Qué te gustaría hacer ahora?</h2>
	
			<div class="row align-items-start">
				<ul>
					<li><a href="sugeridor.jsp">Obtener sugerencias</a></li>
					<li><a href="visualizar.jsp">Ver todas las atracciones/promociones</a></li>
					<li><a href="itinerario.jsp">Ver mi itinerario</a></li>
				</ul>
			</div>
		</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
		 
		 
		 </div>
		

			<jsp:include page="../../partials/footer.jsp"></jsp:include>
				
</body>
		


</html>