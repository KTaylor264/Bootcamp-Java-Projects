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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="purple">Welcome!</h1>
			<p>Join our growing community.</p>
		</div>
		<div class="bottom-box">
			<div class="side-box">
				<h1>Register</h1>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="p-design">
						<form:label path="userName" class="form-label">User Name: </form:label>
						<form:errors path="userName" class="text-danger"/>
						<form:input pattern="[A-Za-z]+" title="Letters only; at least 3 characters long" path="userName" class="form-input"/>
					</div>
					<div class="p-design">
						<form:label path="email" class="form-label">Email: </form:label>
						<form:errors path="email" class="text-danger"/>
						<form:input type="email" path="email" class="form-input"/>
					</div>
					<div class="p-design">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:errors path="password" class="text-danger"/>
						<form:input type="password" path="password" class="form-input"/>
					</div>
					<div class="p-design">
						<form:label path="confirm" class="form-label">Confirm PW: </form:label>
						<form:errors path="confirm" class="text-danger"/>
						<form:input type="password" path="confirm" class="form-input"/>
					</div>
					<div class="right-side">
						<input type="submit" value="Register" class="submit-btn"/>
					</div>
				</form:form>
			</div>
			<div class="side-box">
				<h1>Log In</h1>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="p-design">
						<form:label path="loginEmail" class="form-label">Email: </form:label>
						<form:errors path="loginEmail" class="text-danger"/>
						<form:input type="email" path="loginEmail" class="form-input"/>
					</div>
					<div class="p-design">
						<form:label path="loginPassword" class="form-label">Password: </form:label>
						<form:errors path="loginPassword" class="text-danger"/>
						<form:input type="password" path="loginPassword" class="form-input"/>
					</div>
					<div class="right-side">
						<input type="submit" value="Login" class="submit-btn"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>