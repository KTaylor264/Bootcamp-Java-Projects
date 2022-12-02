<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Reading Books</title>
</head>
<body>

<div class="container">
	<h1><c:out value="${book.title}"></c:out></h1>
	<p>
		Description: <c:out value="${book.description}"></c:out><br>
		Language: <c:out value="${book.language}"></c:out><br>
		Number of Pages: <c:out value="${book.numberOfPages}"></c:out>
	</p>
</div>

</body>
</html>