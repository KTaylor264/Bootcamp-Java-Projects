<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Home Page</title>
</head>
<body>
	<div class="container">
		<h1 class="purple">Welcome, <c:out value="${loggedUser.getUserName()}"/>!</h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<a href="${pageContext.servletContext.contextPath}/logout">Logout</a>
	</div>
</body>
</html>