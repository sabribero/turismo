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
<body class="bg-general" style="color: white">

	<jsp:include page="../../partials/nav.jsp"></jsp:include>

<div class="centrado">

<h1> Banco de Monedas de la Tierra Media</h1>


    </div>

	<br>
	<br>
	<br>
	
	
	
	


	<div class="container" style="background-color:#373B3E">
	
	
	<table class="table" style="color: white">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Precio de cada moneda</th>
      <th scope="col"></th>
      <th scope="col">$ 200</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">#</th>
      <td>Valor Dolar</td>
      <td></td>
      <td> $	<c:out value="${moneda.getARS()}" /></td>
    </tr>
    <tr>
      <th scope="row">#</th>
      <td>Valor Euro</td>
      <td></td>
      <td> $	<c:out value="${valoreuro}" /></td>
    </tr>
    <tr>
      <th scope="row">#</th>
      <td colspan="2">Valores actuales de freecurrencyapi.net</td>
      <td></td>
    </tr>
  </tbody>
</table>
	
	
	
	
		<div class="row">

			<div class="col-md-4 offset-md-4">	<h2>Bienvenido humano, mi nombre es Gollum</h2>
	
	<h2>y voy a ayudarte a
		conocer tu riqueza.</h2></div>
		</div>
		<div class="row">
			<div class="col-md-3 offset-md-2">
			
			
			
			<form action="/turismo_webapp/apisServlets/calcular.do"
				method="get">




				<!-- <div class="row"> -->
				<div  >

						Ingresa una moneda:

					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="selec_peso" value="selec_peso" checked> <label
							class="form-check-label" for="selec_peso"> Pesos </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios2" value="selec_dolar"> <label
							class="form-check-label" for="exampleRadios2"> Dolar </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios3" value="selec_euro"> <label
							class="form-check-label" for="exampleRadios3"> Euro </label>
					</div>


				</div>



				<div class="col-md-4">
					<label for="validationCustom01" class="form-label">Ingresa
						la cantidad de dinero a cambiar</label> <input type="number" class="form-control"
						name="cantidadDeDinero" id="cant_dinero" value="Mark" required>
					<div class="valid-feedback">Se ve bien!</div>
				</div>

				<div class="col-12">
					<button class="btn btn-primary" type="button" onclick="displayRadioValue()">Calcular
						Monedas</button>
				</div>
			</form>
			
			
			
     <h1>
      <div id="result"></div>
     
     </h1>

			
			
			
			
			
			
			
			
			
			
			</div>
			<div class="col-md-3 offset-md-3"><img src="../assets/gollum_vendedor.png"></div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>






		<div class="col-md-4 offset-md-3">





			
			<br>
<br><br><br><br><br><br>

      
    <script>
        function displayRadioValue() {
            var ele = document.getElementsByName('exampleRadios');
            
            var inputValue = document.getElementById("cant_dinero").value; 
            
            var preciodolar=${moneda.getARS()};
            var precioeuro=${moneda.getEUR()};
              
                if(ele[0].checked){
                document.getElementById("result").innerHTML
                        = "Monedas que puedes comprar: "+parseInt(inputValue/200) +" Moneda(s)";
            }
                
                if(ele[1].checked){
                    document.getElementById("result").innerHTML
                            = "Monedas que puedes comprar: "+parseInt((inputValue*preciodolar)/200)  +" Moneda(s)";
                }
                
                if(ele[2].checked){

                    document.getElementById("result").innerHTML
                            = "Monedas que puedes comprar: "+parseInt(((inputValue*preciodolar)/precioeuro)/200)  +" Moneda(s)" ;
                }
        }
    </script>


<br><br><br><br><br><br><br><br><br>



		</div>

	</div>













	<jsp:include page="../../partials/footer.jsp"></jsp:include>

</body>



</html>