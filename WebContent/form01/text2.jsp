<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input.form-control {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<form action="text2action.jsp" method="get">
			<h1>텍스트입력폼 02</h1>

			<div class="form-group">
				<label>number1:</label> <input type="text" name="number1"
					class="form-control" value="34" />
			</div>

			<div class="form-group">
				<label>number2:</label> <input type="text" name="number2"
					class="form-control" value="8" />
			</div>

			<div class="form-group">
				<input type="submit" class="btn btn-default" name="cmd" value="+">
				<input type="submit" class="btn btn-default" name="cmd" value="-">
				<input type="submit" class="btn btn-default" name="cmd" value="*">
				<input type="submit" class="btn btn-default" name="cmd" value="/">
			</div>

		</form>
	</div>
</html>