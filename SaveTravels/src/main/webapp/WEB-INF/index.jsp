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
<title>Expense Document</title>
</head>
<body>
	<div class="top-box">
		<h1 class="blue-title">Save Travels</h1>
		<table>
			<thead>
				<tr>
					<th style="width:400px">Expense</th>
					<th style="width:300px">Vendor</th>
					<th style="width:200px">Amount</th>
					<th style="width:200px">Actions</th>
				</tr>
			</thead>
			<tbody>
				<!-- loop over all the books to show the details as in the wireframe! -->
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td>
							<a href="${pageContext.servletContext.contextPath}/expenses/${expense.id}">
							<c:out value="${expense.expenseName}"/></a>
						</td>
						<td><c:out value="${expense.vendor}"/></td>
						<td>$<c:out value="${expense.amount}"/></td>
						<td>
							<a href="${pageContext.servletContext.contextPath}/expenses/edit/${expense.id}"><c:out value="Edit"/></a>
							<form action="/expenses/${expense.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="delete-btn">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="bottom-box">
		<h2 class="blue-title">Add an Expense: </h2>
		<p class="text-danger">Description must not be blank</p><br>
		<form:form action="/create" method="post" modelAttribute="expense">
			<div class="p-design">
				<form:label path="expenseName" class="form-label">Expense Name: </form:label>
				<form:errors path="expenseName" class="text-danger"/>
				<form:input path="expenseName" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="vendor" class="form-label">Vendor: </form:label>
				<form:errors path="vendor" class="text-danger"/>
				<form:input path="vendor" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="amount" class="form-label">Amount: </form:label>
				<form:errors path="amount" class="text-danger"/>
				<form:input type="number" step="0.01" path="amount" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="description" class="form-label">Description: </form:label>
				<form:errors path="description" class="text-danger"/>
				<form:textarea type="description" path="description" cols="40" rows="5" class="form-input"/>
			</div>
			<div class="right-side">
				<input type="submit" value="Submit" class="submit-btn"/>
			</div>
		</form:form>
	</div>
</body>
</html>