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
<title>Omikuji</title>
</head>
<body>
	<div class="container">
		<div class="text-center" style="margin: 20px">
			<h1>Send an Omikuji!</h1>
		</div>
		<div class="d-flex justify-content-center">
			<div class="form-border">
				<form action="/send" method="POST">
					<div class="sm-box">
						<label>Pick any number from 5 to 25</label>
						<input type="number" name="year" min="5" max="25">
					</div>
					<div class="sm-box">
						<label>Enter the name of any city:</label>
						<input type="text" name="city">				
					</div>
					<div class="sm-box">
						<label>Enter the name of any real person:</label>
						<input type="text" name="person">
					</div>
					<div class="sm-box">
						<label>Enter professional endeavor or hobby:</label>
						<input type="text" name="hobby">
					</div>
					<div class="sm-box">
						<label>Enter any type of living thing:</label>
						<input type="text" name="alive">
					</div>
					<div class="sm-box">
						<label>Say something nice to someone:</label>
						<textarea name="quote" cols="20" rows="3"></textarea>
					</div>
					<div class="sm-box">
						<label class="send">Send and show to a friend</label>
					</div>
					<div class="send-div">
						<input type="submit" value="send">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>