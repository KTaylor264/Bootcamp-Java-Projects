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
<title>Edit Burgers</title>
</head>
<body>
	<div class="big-box">
		<div class="div-design">
			<h1 class="blue-title">Edit Burger</h1>
			<a href="${pageContext.servletContext.contextPath}/">Go Back</a>
		</div>
			<form:form action="/burgers/${burger.id}" method="post" modelAttribute="burger" >
			    <input type="hidden" name="_method" value="put">
			    <p class="p-design">
			        <form:label path="burgerName" class="form-label">Burger Name</form:label>
			        <form:errors path="burgerName" class="text-danger"/>
			        <form:input path="burgerName" class="form-input"/>
			    </p>
			    <p class="p-design">
			        <form:label path="restaurantName" class="form-label">Restaurant Name</form:label>
			        <form:errors path="restaurantName" class="text-danger"/>
			        <form:input path="restaurantName" class="form-input"/>
			    </p>
			    <p class="p-design">
			        <form:label path="rating" class="form-label">Rating</form:label>
			        <form:errors path="rating" class="text-danger"/>
			        <form:input type="number" path="rating" class="form-input"/>
			    </p>
			    <p class="p-design">
			        <form:label path="notes" class="form-label">Notes</form:label>
			        <form:errors path="notes"/>     
			        <form:textarea type="notes" path="notes" cols="40" rows="5" class="form-input"/>
			    </p>
			    <div class="right-side">
   			    	<input type="submit" value="Submit" class="submit-btn"/>
			    </div>
			</form:form>
	</div>
</body>
</html>