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
<title>Ninja Gold Game</title>
</head>
<body>
	<div class="d-flex gold-margin">
		<h1 class="gold-margin">Your Gold: </h1>
		<h1 class="gold-box">${gold}</h1>
	</div>
	<div class="container d-flex text-center gold-margin">
		<div class="col quest-box">
			<h1>Farm</h1>
			<h3>(earns 10-20 gold)</h3>
			<form action="/embark" method=POST>
				<input type="hidden" name="quest" value="farm">
				<input type="hidden" name="minGold" value="10">
				<input type="hidden" name="maxGold" value="20">
				<input type="submit" value="Find Gold!" class="gold-button">
			</form>
		</div>
		<div class="col quest-box">
			<h1>Cave</h1>
			<h3>(earns 5-10 gold)</h3>
			<form action="/embark" method=POST>
				<input type="hidden" name="quest" value="cave">
				<input type="hidden" name="minGold" value="5">
				<input type="hidden" name="maxGold" value="10">
				<input type="submit" value="Find Gold!" class="gold-button">
			</form>
		</div>
		<div class="col quest-box">
			<h1>House</h1>
			<h3>(earns 2-5 gold)</h3>
			<form action="/embark" method=POST>
				<input type="hidden" name="quest" value="house">
				<input type="hidden" name="minGold" value="2">
				<input type="hidden" name="maxGold" value="5">
				<input type="submit" value="Find Gold!" class="gold-button">
			</form>
		</div>
		<div class="col quest-box">
			<h1>Quest</h1>
			<h3>(earns/takes 0-50 gold)</h3>
			<form action="/embark" method=POST>
				<input type="hidden" name="quest" value="quest">
				<input type="hidden" name="minGold" value="0">
				<input type="hidden" name="maxGold" value="50">
				<input type="submit" value="Find Gold!" class="gold-button">
			</form>
		</div>
	</div>
	<div class="gold-margin">
		<h1 class="gold-margin">Activities: </h1>
		<p class="activity-box">
			<c:forEach var="oneAction" items="${quest}">
				<c:out value="${oneAction}"></c:out><br>
			</c:forEach>
		</p>
	</div>
</body>
</html>