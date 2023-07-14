<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
</head>
<body>
	<div align="center">
		<h3>Hello Coordinador!</h3>
	
		<!-- nombre del usuario -->
		<security:authentication property="principal.username" var="username"/>
			
		Bienvenido <b>${username}</b>, usted está en la página COORDINADOR. <br><br>
		
		<table>
			<tr>
				<td><b>ID</b></td>
				<td><b>Titulo</b></td>
				<td><b>Tipo</b></td>
				<td><b>Contenido</b></td>
				<td><b>Acción</b></td>
			</tr>
			
			<c:forEach var="publicacion" items="${bPublicacion}">
				<c:if test="${publicacion.bandera eq 'deshabilitado'}">
					<tr>
						<td>${publicacion.publicacionId}</td>
						<td>${publicacion.titulo}</td>
						<td>${publicacion.tipo}</td>
						<td>${publicacion.contenido}</td>
						<td>
							<a href="<c:url value='/admin/habilitar/${publicacion.publicacionId}'/>">Habilitar</a> |
							<a href="<c:url value='/admin/borrar/${publicacion.publicacionId}'/>">Borrar</a> 
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table> <br>
		
		<a href="<c:url value='/index'/>">Index</a> | 
		<a href="<c:url value='/registration'/>">New User</a> | 
		<a href="<c:url value='/logout'/>">Logout</a>	
	</div>
</body>
</html>