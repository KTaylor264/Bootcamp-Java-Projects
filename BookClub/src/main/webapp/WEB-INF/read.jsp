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
<title>Read Share</title>
</head>
<body>
	<div class="container">
		<div class="header-two">
			<h1><c:out value="${book.getTitle()}"/></h1>
			<a href="${pageContext.servletContext.contextPath}/books">Back to the shelves</a>
		</div>
		<div class="header">
			<h2><c:out value="${book.user.userName}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/></h2>
		</div>
		<div class="header">
			<h2>Here are <c:out value="${book.user.userName}"/>'s thoughts: </h2>
		</div>
		<div class="header">
			<p><c:out value="${book.thoughts}"/></p>
		</div>
	</div>
</body>
</html>