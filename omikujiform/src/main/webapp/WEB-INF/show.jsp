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
<title>Omikuji Fortune</title>
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h1>Here's Your Omikuji!</h1>
		</div>
		<div class="d-flex justify-content-center">
			<div class="results-border">
				<h1 class="sm-box">In <c:out value="${year}">years</c:out> years, you will live in <c:out value="${city}">city</c:out> with 
				<c:out value="${person}">person</c:out> as your roommate, <c:out value="${hobby}">hobby</c:out> for a living.
				 The next time you see a <c:out value="${alive}">creature</c:out>, you will have good luck. Also,
				  <c:out value="${quote}">quote</c:out></h1>
			</div>
		</div>
		<div class="sm-box text-center">
			<a href="${pageContext.servletContext.contextPath}/">Go Back</a>
		</div>
	</div>
</body>
</html>