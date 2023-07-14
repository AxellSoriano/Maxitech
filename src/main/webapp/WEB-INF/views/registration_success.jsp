<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- libreria JSTL core -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration_succes</title>
</head>
<body>
	<h3>Registration Success!</h3>
	<p>¡Usuario registrato exitosamente!</p>
	
	<a href="<c:url value='/registration'/>">New User</a> | 
	<a href="<c:url value='/admin'/>">Go to Admin</a> | 
	<a href="<c:url value='/index'/>">Index</a> | 
	<a href="<c:url value='/logout'/>">Logout</a>	
</body>
</html>