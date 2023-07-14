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
<title>HOME</title>
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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"></a></li>
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
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div align="center">
		<h3>Tienda-MAXITECH!</h3>


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
			<button type="button" class="btn btn-primary">
				<a href="<c:url value='/login'/>">Login</a>
			</button>
			<br>
			<br>
		</security:authorize>
	</div>

</body>
</html>