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
<body class="bg-general" style= "color: white">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>

<br><br><br><br>

<div class="centrado">
  <h1>El clima en Tierra Media</h1>
  <h2> El siguiente es el pronostico del clima para el dia de mañana en Tierra Media segun el Servicio Meteorologico Nacional Argentino.</h2>

<br><br>
</div>

<br><br>


<div class="accordion" id="accordionExample" style="color: black">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        Temperatura por la mañana
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>Por la mañana la temperatura aproximada sera de 		<c:out value="${parana.getWeather().getMorning_temp()}" /> grados centigrados.</strong>
        </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       Temperatura por la tarde
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>Por la tarde la temperatura aproximada sera de 			<c:out value="${parana.getWeather().getAfternoon_temp() }" /> grados centigrados.</strong>
        </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Estado del tiempo por la mañana:
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>	<c:out value="${parana.getWeather().getMorning_desc()}" /></strong>
         </div>
    </div>
  </div>
  
   <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        Estado del tiempo por la tarde:
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      <Strong> <c:out value="${parana.getWeather().getAfternoon_desc() }" />   </Strong>  
</div>
    </div>
  </div>
</div>

<br><br><br>

<div class="centrado">

  <p>Si te gustaria saber mas sobre como va a estar el clima los proximos dias, puedes visitar la apgina oficial del SMN</p>
  <a class="btn btn-primary btn-lg" href="https://www.smn.gob.ar/" target="_blank" role="button">Visitar SMN</a>

</div>



<br>
	<jsp:include page="../../partials/footer.jsp"></jsp:include>

</body>



</html>