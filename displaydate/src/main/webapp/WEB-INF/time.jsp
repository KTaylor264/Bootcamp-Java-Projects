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
<script type="text/javascript">
	$(document).ready(function () {openTime();});
</script>
<title>Display Date: Time Page</title>
</head>
<body>
	<div class="container text-center align-items-center time">
		<h1 class="col">
			<c:out value="${time}"></c:out>
		</h1>
	</div>
</body>
</html>