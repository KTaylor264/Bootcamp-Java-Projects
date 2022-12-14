<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="js/function.js"></script>
<title>Display Date: Home Page</title>
</head>
<body>
	<div class="container text-center">
	<div class="row align-items-center" style="height: 100px">
			<div class="col">
			<a href="${pageContext.servletContext.contextPath}/date">Date Template</a>
		</div>
		<div class="col">
			<a href="${pageContext.servletContext.contextPath}/time">Time Template</a>
		</div>
	</div>
	</div>
</body>
</html>