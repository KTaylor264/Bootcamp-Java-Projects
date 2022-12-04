<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>Show Dojo</title>
</head>
<body>
	<div class="container">
		<h1><c:out value="${dojo.name}"/></h1>
	</div>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th style="width:300px">First Name</th>
					<th style="width:300px">Last Name</th>
					<th style="width:100px">Age</th>
				</tr>
			</thead>
			<tbody>
				<!-- loop over all the ninjas to show the details as in the wireframe! -->
				<c:forEach var="ninja" items="${dojo.ninjas}">
					<tr>
						<td><c:out value="${ninja.firstName}"/></td>
						<td><c:out value="${ninja.lastName}"/></td>
						<td><c:out value="${ninja.age}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>