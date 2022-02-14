<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
	
		
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				
				
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/turismo_webapp/views/user/user.jsp">			<img src="/turismo_webapp/assets/header.png" align="left" width="100" height="40"></a></li>
						
						
						
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							FAQ </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/turismo_webapp/que-es-tierra-media.jsp">¿Qué es tierra media?</a></li>
							<li><a class="dropdown-item disabled" href="#">¿Cómo usar esta página?</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="https://es.wikipedia.org/wiki/Tierra_Media" target="_blank">Mas Información</a></li>
						</ul></li>
						
											<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Banco de Monedas </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/turismo_webapp/apisServlets/moneda.do">Calcular Monedas</a></li>
							<li><a class="dropdown-item disabled" href="#">Comprar Monedas</a></li>


						</ul></li>
						
															<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Ver Pronostico </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/turismo_webapp/apisServlets/clima.do">Mañana</a></li>
							<li><a class="dropdown-item disabled" href="#">Pasado Mañana</a></li>


						</ul></li>						

						
						
			<c:if test="${user.esAdmin}">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Ver como </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/turismo_webapp/views/admin/admin.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="/turismo_webapp/views/user/user.jsp">Usuario</a></li>


						</ul></li>
		</c:if>
		

						
						
						

						
				</ul>
			</div>
			
			
			<!--  -->
			
			
			
						<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					
					
					<img src="/turismo_webapp/assets/engranaje.png" align="left" width="30" height="30">
					
					&nbsp;&nbsp;
						<c:out value="${user.nombre}"></c:out>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item disabled" style="color: black;">
						
											<img src="/turismo_webapp/assets/monedaoro.png" align="left" width="30" height="30">
					
					&nbsp;&nbsp;
						
							 Monedas:  <c:out value="${user.presupuesto}"></c:out>
						</a></li>
						<li><a class="dropdown-item disabled" style="color: black;">
						
											<img src="/turismo_webapp/assets/reloj.png" align="left" width="30" height="30">
					
					&nbsp;&nbsp;
						
							Tiempo:  <c:out value="${user.tiempoDisponible}h"></c:out>
						</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a href="/turismo_webapp/logout" class="dropdown-item">Salir</a></li>
					</ul>
				</li>
			</ul>
			
			
			<!--  -->
			
			
			
			
		</div>
	</nav>