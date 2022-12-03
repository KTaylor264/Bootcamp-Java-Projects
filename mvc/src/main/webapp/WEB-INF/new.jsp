<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Save New Book</title>
</head>
<body>

<div class="container grey-container">
	<h1>New Book</h1>
	<form:form action="/books" method="post" modelAttribute="book" class="white-container">
		<div class="box">
			<form:label path="title">Title</form:label><br>
			<form:errors path="title" class="text-danger"/>
			<form:input path="title"/>
		</div>
		<div class="box">
			<form:label path="description">Description</form:label><br>
			<form:errors path="description" class="text-danger"/>
			<form:textarea path="description" cols="40" rows="5"></form:textarea>
		</div>
		<div class="box">
			<form:label path="language">Language</form:label><br>
			<form:errors path="language" class="text-danger"/>
			<form:input path="language"/>
		</div>
		<div class="box">
			<form:label path="numberOfPages">Pages</form:label><br>
			<form:errors path="numberOfPages" class="text-danger"/>
			<form:input type="number" path="numberOfPages"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
</div>

</body>
</html>