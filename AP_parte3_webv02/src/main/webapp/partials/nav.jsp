<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
	
		
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/AP_parte3_webv02/index.jsp">TIERRA MEDIA</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				
				
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/AP_parte3_webv02/index.jsp">Home</a></li>
						
						
						
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							FAQ </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/AP_parte3_webv02/que-es-tierra-media.jsp">¿Qué es tierra media?</a></li>
							<li><a class="dropdown-item" href="#">¿Cómo usar esta página?</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Información</a></li>
						</ul></li>
						
						
			<c:if test="${user.esAdmin}">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Ver como </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/AP_parte3_webv02/views/admin/admin.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="/AP_parte3_webv02/views/user/user.jsp">Usuario</a></li>


						</ul></li>
		</c:if>
						
						
						
						

						
				</ul>
			</div>
			
			
			<!--  -->
			
			
			
						<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<c:out value="${user.nombre}"></c:out>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item disabled" style="color: black;">
							<i title="monedas" style="color: gold;" class="bi bi-coin"></i> Monedas:  <c:out value="${user.presupuesto}"></c:out>
						</a></li>
						<li><a class="dropdown-item disabled" style="color: black;">
							<i title="tiempo" style="color: blue;" class="bi bi-clock-fill"></i>Tiempo:  <c:out value="${user.tiempoDisponible}h"></c:out>
						</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a href="/AP_parte3_webv02//logout" class="dropdown-item">Salir</a></li>
					</ul>
				</li>
			</ul>
			
			
			<!--  -->
			
			
			
			
		</div>
	</nav>