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
<title>New Ninja</title>
</head>
<body>
	<div class="container">
		<h1>New Ninja</h1>
	</div>
	<div class="container">
		<form:form action="/create-ninja" method="post" modelAttribute="ninja">
			<div class="p-design">
				<form:label path="firstName" class="form-label">First Name: </form:label>
				<form:errors path="firstName" class="text-danger"/>
				<form:input path="firstName" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="lastName" class="form-label">Last Name: </form:label>
				<form:errors path="lastName" class="text-danger"/>
				<form:input path="lastName" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="age" class="form-label">Age: </form:label>
				<form:errors path="age" class="text-danger"/>
				<form:input type="number" path="age" class="form-input"/>
			</div>
			<div class="p-design">
				<form:label path="dojo" class="form-label"> Dojo: </form:label>
				<form:errors path="dojo" class="text-danger"/>
				<form:select path="dojo" class="form-input">
					<c:forEach var="dojo" items="${dojos}">
						<option value="${dojo.id}">${dojo.name}</option>
					</c:forEach>
				</form:select>
			</div>
			<div class="right-side">
				<input type="submit" value="Create Ninja" class="submit-btn"/>
			</div>
		</form:form>
	</div>
</body>
</html>