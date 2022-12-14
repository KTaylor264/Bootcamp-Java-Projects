<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Counter Check Page</title>
</head>
<body>
	<div class="container">
		<div class="para">
			<div>
				<p>You have visited <a href="#">http://your_server</a> <c:out value="${count}"></c:out> times.</p>
				<p><a href="${pageContext.servletContext.contextPath}/">Test another visit?</a></p>
			</div>
		</div>
	</div>
</body>
</html>