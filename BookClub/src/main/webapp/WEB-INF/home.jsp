<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
		<div class="header-two">
			<h1>Welcome, <c:out value="${loggedUser.getUserName()}"/></h1>
			<a href="${pageContext.servletContext.contextPath}/logout">Logout</a>
		</div>
		<div class="header-two">
			<p>Books from everyone's shelves:</p>
			<a href="${pageContext.servletContext.contextPath}/books/new">+ Add a book to my shelf!</a>
		</div>
		<div>
			<table>
				<thead>
					<tr>
						<th style="width: 50px">ID</th>
						<th style="width: 300px">Title</th>
						<th style="width: 200px">Author Name</th>
						<th style="width: 200px">Posted By</th>
					</tr>
				</thead>
				<tbody>
					<!-- loop over all the books to show the details as in the wireframe! -->
					<c:forEach var="book" items="${books}">
						<tr>
							<td><c:out value="${book.id}"></c:out></td>
							<td><a href="${pageContext.servletContext.contextPath}/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
							<td><c:out value="${book.author}"></c:out></td>
							<td><c:out value="${book.user.userName}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>