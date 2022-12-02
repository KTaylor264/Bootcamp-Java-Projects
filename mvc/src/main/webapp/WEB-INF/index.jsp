<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
	<h1>All Books</h1>
	<table>
		<thead>
			<tr>
				<th style="width: 50px">ID</th>
				<th style="width: 300px">Title</th>
				<th style="width: 200px">Language</th>
				<th style="width: 100px"># Pages</th>
			</tr>
		</thead>
		<tbody>
			<!-- loop over all the books to show the details as in the wireframe! -->
			<c:forEach var="book" items="${books}">
				<tr>
					<td><c:out value="${book.id}"></c:out></td>
					<td><a href="${pageContext.servletContext.contextPath}/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
					<td><c:out value="${book.language}"></c:out></td>
					<td><c:out value="${book.numberOfPages}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>