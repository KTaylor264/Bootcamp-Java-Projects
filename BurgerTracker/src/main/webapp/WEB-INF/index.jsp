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
<title>Burger Tracker</title>
</head>
<body>
	<div class="big-box">
		<h1 class="blue-title">Burger Tracker</h1>
		<table>
			<thead>
				<tr>
					<th style="width:200px">Burger Name</th>
					<th style="width:200px">Restaurant Name</th>
					<th style="width:200px">Rating (out of 5)</th>
					<th style="width:100px">Action</th>
				</tr>
			</thead>
			<tbody>
				<!-- loop over all the books to show the details as in the wireframe! -->
				<c:forEach var="burger" items="${burgers}">
					<tr>
						<td><c:out value="${burger.burgerName}">Burger Name</c:out></td>
						<td><c:out value="${burger.restaurantName}">Restaurant Name</c:out></td>
						<td><c:out value="${burger.rating}">Rating</c:out></td>
						<td><a href="${pageContext.servletContext.contextPath}/burgers/edit/${burger.id}"><c:out value="Edit"/></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="small-box">
		<h2 class="blue-title">Add a Burger: </h2>
		<p class="text-danger">Notes must not be blank</p><br>
		<form:form action="/show" method="post" modelAttribute="burger">
			<div class="p-design">
				<form:label path="burgerName" class="form-label">Burger Name</form:label>
				<form:errors path="burgerName" class="text-danger"/>
				<form:input path="burgerName" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="restaurantName" class="form-label">Restaurant Name</form:label>
				<form:errors path="restaurantName" class="text-danger"/>
				<form:input path="restaurantName" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="rating" class="form-label">Rating</form:label>
				<form:errors path="rating" class="text-danger"/>
				<form:input type="number" path="rating" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="notes" class="form-label">Notes</form:label>
				<form:errors path="notes" class="text-danger"/>
				<form:textarea type="notes" path="notes" cols="40" rows="5" class="form-input"/>
			</div>
			<div class="right-side">
				<input type="submit" value="Submit" class="submit-btn"/>
			</div>
		</form:form>
	</div>
</body>
</html>