<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	layout:decorate="~{layout/layout}">
<head>
<meta charset="ISO-8859-1">
<title>login</title>
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

		<h3>BIENVENIDO A LA TIENDA MAXITECH!</h3>

		<!-- arhivo externo -->
		<img src="<c:url value='images/mesa de trabajo 1.png'/>" alt="null"
			width="250" height="250"> <br>

		<c:url value="/login" var="loginURL" />

		<form name="" method="post" action="${loginURL}">
			<!-- token de seguridad -->
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<!-- si se accede con credenciales erróneas -->
			<c:if test="${param.error != null}">
				<p style="color: red;">¡Error, acceso denegado!</p>
			</c:if>

			<!-- si se cierra sesión -->
			<c:if test="${param.logout != null}">
				<p style="color: green;">¡Usted se ha desconectado!</p>
			</c:if>

			Username: <input type="text" name="username" /> <br> Password: <input
				type="password" name="password" /> <br> <input type="checkbox"
				name="chkRememberMe" />Recuérdame <br>
			<br>

			<button type="submit">Iniciar sesión</button>
			| <a href="<c:url value='/index'/>">Index</a>
		</form>

	</div>
</body>
</html>





