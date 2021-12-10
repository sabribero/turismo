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



Esto es un monedero!!!

<br><br><br>

						<br>
						Valor Dolar: <c:out value="${moneda.getARS()}" />!
		<br>
		
								<br>
						Valor Euro: <c:out value="${valoreuro}" />!
		<br>

		




		

			<jsp:include page="../../partials/footer.jsp"></jsp:include>
				
</body>
		


</html>