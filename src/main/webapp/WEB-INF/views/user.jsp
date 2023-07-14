<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Spring Tag Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user</title>
</head>
<body>
	<h3>Bienvenido Vendedor!</h3>
	
	<!-- nombre del usuario -->
	<security:authentication property="principal.username" var="username"/>
		
	Bienvenido <b>${username}</b>, usted está en la página VENDEDOR. <br><br>
	
	Ingrese las promociones: <br><br>
	
	<form:form name="" method="post" modelAttribute="publicacion" enctype="multipart/form-data">
		Título: <form:input type="text" path="titulo"/> <br>
		Tipo: 
		<form:select path="tipo">
		 	<form:option value="MONITORES">Monitores</form:option>
		 	<form:option value="TELEVISORES">Televisores</form:option>
		 	<form:option value="CPU">CPU</form:option>
		 	<form:option value="LAPTOPS">Laptops</form:option>
		</form:select> <br>
		Contenido: <form:textarea rows="5" cols="25" path="contenido"></form:textarea> <br>
		
		Archivo: <input type="file" name="myfile"/> <br><br>
		
		<!-- oculto -->
		<input type="hidden" name="userId" value="${userVo.userId}"/>
		
		<!-- oculto -->
		<form:input type="hidden" path="bandera" value="deshabilitado"/>
		
		<button type="submit">Enviar</button>			
	</form:form> <br>
	
	<a href="<c:url value='/index'/>">Index</a> | 
	<a href="<c:url value='/logout'/>">Logout</a>	
</body>
</html>