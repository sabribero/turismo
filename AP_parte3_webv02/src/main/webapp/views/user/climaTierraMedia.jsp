<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tierra Media</title>

<link rel="shortcut icon" href="FAVICO-TMA.png" />

<jsp:include page="../../partials/head.jsp"></jsp:include>



</head>
<body class="bg-general">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>





	<br>
	<br> <h1>El siguiente es el pronostico del clima para el dia de mañana segun el Servicio Meteorologico Nacional Argentino:
	</h1>
	<br>

	<br> Temperatura Minima:
	<c:out value="${parana.getWeather().getMorning_temp()}" />
	!
	<br>


	<br> Temperatura Maxima:
	<c:out value="${parana.getWeather().getAfternoon_temp() }" />
	!
	<br> 
	<br> Estado por la mañana:
	<c:out value="${parana.getWeather().getMorning_desc()}" />
	!

	<br>

	<br> Estado por la tarde:
	<c:out value="${parana.getWeather().getAfternoon_desc() }" />
	!
	<br>






	<jsp:include page="../../partials/footer.jsp"></jsp:include>

</body>



</html>