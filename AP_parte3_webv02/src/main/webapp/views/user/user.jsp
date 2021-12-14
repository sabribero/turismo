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

	<jsp:include page="../../partials/nav.jsp"></jsp:include>


	<div class="container contenedor">
		<ul class="nav nav-tabs nav-fill nav-dark">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/user/ofertador.do">Obtener sugerencias</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/visualizar.do">Ver Atracciones/Promociones</a></li>
			<li class="nav-item"><a class="nav-link" href="/AP_parte3_webv02/attractions/itinerario.do">Mi Itinerario</a></li>
		</ul>
		 <header class="headercentrado"> 



		<h3>
				¡Bienvenido, <c:out value="${user.nombre}" />!
				<br>
		</h3>
									
										
	
			<ul class="centrado recuadro">
					<li>* Te quedan <c:out value="${user.presupuesto}" /> monedas.</li>
					<li>* Te quedan <c:out value="${user.tiempoDisponible}" /> horas libres.</li>
			</ul>
			
					<p><a href="/AP_parte3_webv02/cambiarpass.jsp"> Cambiar contraseña</a></p> 
	</header> 
		 
	 </div>

			<jsp:include page="../../partials/footer.jsp"></jsp:include>
				
</body>
		


</html>