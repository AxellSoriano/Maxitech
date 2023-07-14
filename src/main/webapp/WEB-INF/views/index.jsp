<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- librería JSTL -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- libreria Spring Security -->
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	layout:decorate="~{layout/layout}">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MENÚ PRINCIPAL</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value='/index'/>">MAXITECH</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<c:url value='/home'/>">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Link </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Link</a></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search"> <br> <br>
					<!-- si el usuario está autenticado (en sesión) -->
					<security:authorize access="isAuthenticated()">

						<security:authorize access="hasRole('USER')">
							<a href="<c:url value='/user'/>">Go to USER</a> | 
			</security:authorize>

						<security:authorize access="hasRole('ADMIN')">
							<a href="<c:url value='/admin'/>">Go to ADMIN</a> | 
			</security:authorize>

						<a href="<c:url value='/logout'/>">Logout </a>
						<button type="button" class="btn btn-success">Success</button>
						<br>
						<br>
					</security:authorize>

					<!-- si el usuario es anónimo (no está en sesión) -->
					<security:authorize access="isAnonymous()">

						<a href="<c:url value='/login'/>" class="btn btn-primary"
							role="button">Login</a>
			</div>
			<br> <br>
			</security:authorize>
			</form>
		</div>
		</div>
	</nav>
	<div class="container-xpand">

		<nav class="navbar navbar-expand-md bg-primary navbar-primary">
			<div align="center">
				<h3>PRODUCTOS EN PROMOCIÓN</h3>
			</div>


			<!-- si el usuario está autenticado (en sesión) -->
			<security:authorize access="isAuthenticated()">

				<security:authorize access="hasRole('USER')">
					<a href="<c:url value='/user'/>">Go to USER</a> | 
			</security:authorize>

				<security:authorize access="hasRole('ADMIN')">
					<a href="<c:url value='/admin'/>">Go to ADMIN</a> | 
			</security:authorize>

				<a href="<c:url value='/logout'/>">Logout </a>
				<button type="button" class="btn btn-success">Success</button>
				
			</security:authorize>

			<!-- si el usuario es anónimo (no está en sesión)
		<security:authorize access="isAnonymous()">
			<div class="text-end">
			<a href="<c:url value='/login'/>" class="btn btn-primary" role="button">Login</a>
			</div>
			<br>
			<br>
		</security:authorize> -->
		</nav>
	</div>
	<div class="container-xpand">
	<div id="carouselExampleCaptions" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='images/maxitech4.PNG'/>" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>MAXITECH</h5>
					<p>Promoción por el mes de julio</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..." class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..." class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	</div>
	<table>
		<tr>
			<td><b>ID</b></td>
			<td><b>Titulo</b></td>
			<td><b>Tipo</b></td>
			<td><b>Contenido</b></td>
		</tr>

		<c:forEach var="publicacion" items="${bPublicacion}">
			<c:if test="${publicacion.bandera eq 'habilitado'}">
				<tr>
					<td>${publicacion.publicacionId}</td>
					<td>${publicacion.titulo}</td>
					<td>${publicacion.tipo}</td>
					<td>${publicacion.contenido}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>


</body>
</html>








