<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Edit Expense Task</title>
</head>
<body>
	<div class="top-box">
		<div class="div-design">
			<h1 class="green-title">Edit Expense</h1>
			<a href="${pageContext.servletContext.contextPath}/expenses">Go Back</a>
		</div>
		<form:form action="/expenses/${expense.id}" method="post" modelAttribute="expense" >
		    <input type="hidden" name="_method" value="put">
		    <p class="p-design">
		        <form:label path="expenseName" class="form-label">Expense Name: </form:label>
		        <form:errors path="expenseName" class="text-danger"/>
		        <form:input path="expenseName" class="form-input"/>
		    </p>
		    <p class="p-design">
		        <form:label path="vendor" class="form-label">Vendor: </form:label>
		        <form:errors path="vendor" class="text-danger"/>
		        <form:input path="vendor" class="form-input"/>
		    </p>
		    <p class="p-design">
		        <form:label path="amount" class="form-label">Amount: </form:label>
		        <form:errors path="amount" class="text-danger"/>
		        <form:input type="number" step="0.01" path="amount" class="form-input"/>
		    </p>
		    <p class="p-design">
		        <form:label path="description" class="form-label">Description: </form:label>
		        <form:errors path="description"/>     
		        <form:textarea type="description" path="description" cols="40" rows="5" class="form-input"/>
		    </p>
		    <div class="right-side">
  			    	<input type="submit" value="Submit" class="submit-btn"/>
		    </div>
		</form:form>
	</div>
</body>
</html>