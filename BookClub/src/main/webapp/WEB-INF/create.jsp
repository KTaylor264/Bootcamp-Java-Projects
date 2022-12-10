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
			<h1>Add a Book to Your Shelf!</h1>
			<a href="${pageContext.servletContext.contextPath}/books">Back to the shelves</a>
		</div>
		<div class="indent">
			<p>Author must not be blank</p>
		</div>
		<div>
			<form:form action="/books/create" method="post" modelAttribute="book">
				<div class="p-design">
					<form:label path="title" class="form-label">Title: </form:label>
					<form:errors path="title" class="text-danger"/>
					<form:input path="title" class="form-input-two"/>
				</div>
				<div class="p-design">
					<form:label path="author" class="form-label">Author: </form:label>
					<form:errors path="author" class="text-danger"/>
					<form:input path="author" class="form-input-two"/>
				</div>
				<div class="p-design">
					<form:label path="thoughts" class="form-label">My Thoughts: </form:label>
					<form:errors path="thoughts" class="text-danger"/>
					<form:textarea cols="40" rows="5" path="thoughts" class="form-input-two"/>
				</div>
				<div class="right-side">
					<input type="submit" value="Submit" class="submit-btn"/>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>