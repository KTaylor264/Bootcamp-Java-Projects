<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>New Dojo</title>
</head>
<body>
	<div class="container">
		<h1>New Dojo</h1>
	</div>
	<div class="container">
		<form:form action="/create-dojo" method="post" modelAttribute="dojo">
			<div class="p-design">
				<form:label path="name" class="form-label">Name: </form:label>
				<form:errors path="name" class="text-danger"/>
				<form:input path="name" class="form-input"/>
			</div>
			<div class="right-side">
				<input type="submit" value="Create Dojo" class="submit-btn"/>
			</div>
		</form:form>
	</div>
</body>
</html>