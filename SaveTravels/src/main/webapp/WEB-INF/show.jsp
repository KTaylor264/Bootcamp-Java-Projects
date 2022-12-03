<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Show Expense</title>
</head>
<body>
	<div class="top-box">
		<div class="div-design">
			<h1 class="blue-title">Expense Details</h1>
			<a href="${pageContext.servletContext.contextPath}/expenses">Go Back</a>
		</div>
	</div>
	<div class="new-box">
		<div class="div-direction">
			<div class="show-display">
				<p>Expense Name: </p>
			</div>
			<div class="show-display">
				<p>Expense Description: </p>
			</div>
			<div class="show-display">
				<p>Vendor: </p>
			</div>
			<div class="show-display">
				<p>Amount spend: </p>
			</div>
		</div>
		<div class="div-direction">
			<div class="show-display">
				<c:out value="${expense.expenseName}"></c:out>
			</div>
			<div class="show-display">
				<c:out value="${expense.description}"></c:out>
			</div>
			<div class="show-display">
				<c:out value="${expense.expenseName}"></c:out>
			</div>
			<div class="show-display">
				<c:out value="${expense.amount}"></c:out>
			</div>
		</div>
	</div>
</body>
</html>