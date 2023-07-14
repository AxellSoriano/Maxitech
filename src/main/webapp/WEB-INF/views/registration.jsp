<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- librería Spring Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- libreria JSTL core -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>

	<!-- archivo externo -->
	<link href="<c:url value='css/MyStyle.css'/>" rel="stylesheet">

</head>
<body>
	<h3>Registration - User!</h3>
	
	<!-- sesión normal (usando credenciales) -->
	<security:authorize access="isFullyAuthenticated()">
		<!-- Spring Form -->
		<form:form name="" method="post" modelAttribute="userVo">
			Username: <form:input type="text" path="username"/> 
			<form:errors path="username" cssClass="error"/>
			<br>
			
			Password: <form:input type="password" path="password"/> 
			<form:errors path="password" cssClass="error"/>
			<br>
			
			Nombre: <form:input type="text" path="nombre"/> 
			<form:errors path="nombre" cssClass="error"/>
			<br>
			
			Apellidos: <form:input type="text" path="apellidos"/> 
			<form:errors path="apellidos" cssClass="error"/>
			<br>
			
			Email: <form:input type="text" path="email"/> 
			<form:errors path="email" cssClass="error"/>
			<br>
			
			Celular: <form:input type="text" path="celular"/>
			<form:errors path="celular" cssClass="error"/> 
			<br>
			
			Role(s): 
			<form:select path="itemsRole" items="${bRoles}" itemValue="roleId" itemLabel="type" multiple="true">
			</form:select> 
			<form:errors path="itemsRole" cssClass="error"/>
			<br><br>
			
			<button type="submit">Guardar</button>
			<button type="button" onclick="location.href='<c:url value="/admin"/>'">Cancelar</button>
		</form:form>
	</security:authorize>
	
	<!-- sesión normal (no usando credenciales) -->
	<security:authorize access="isRememberMe()">
		<security:authentication property="principal.username" var="username"/>
		Estimado(a) <b>${username}</b>, debe iniciar sesión con sus credenciales para acceder a esta página. <br>
		<a href="<c:url value='/login'/>">Login</a>
	</security:authorize>
	
</body>
</html>