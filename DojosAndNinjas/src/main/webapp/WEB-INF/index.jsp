<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="container front-page">
		<h1>Dojos and Ninjas</h1>
		<div>
			<br><a href="${pageContext.servletContext.contextPath}/dojos/new/">New Dojo</a><br>
			<a href="${pageContext.servletContext.contextPath}/ninjas/new/">New Ninja</a><br>
		</div>
	</div>
	<div class="container">
		<c:forEach var="dojo" items="${dojos}">
			<p><a href="${pageContext.servletContext.contextPath}/dojo-ninja/show/${dojo.id}">View <c:out value="${dojo.name}"></c:out></a></p>
		</c:forEach>
	</div>
</body>
</html>