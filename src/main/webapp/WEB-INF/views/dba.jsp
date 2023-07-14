<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dba</title>
</head>
<body>
	<h3>Hello DBA!</h3>
	
	<!-- nombre del usuario -->
	<security:authentication property="principal.username" var="username"/>
		
	Bienvenido <b>${username}</b>, usted est� en la p�gina DBA. <br><br>
	
	<a href="<c:url value='/index'/>">Index</a> |
	<a href="<c:url value='/logout'/>">Logout</a>	
</body>
</html>