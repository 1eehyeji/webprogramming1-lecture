<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body form label {
		margin-right: 20px;
	}

	table.table {
		width: 500px;
	}

	thead tr {
		background-color: #eee;
	}
</style>
<title>form01_Exercise01</title>
</head>
<body>
<%
	response.setCharacterEncoding("utf-8");
	int number = 0;

	if ("++".equals(request.getParameter("cmd"))) {
		number = Integer.parseInt(request.getParameter("number1")) + 1;
	} else if("--".equals(request.getParameter("cmd"))) {
		number = Integer.parseInt(request.getParameter("number1")) - 1;
	}
%>
	<div class=container>
		<form method="get">
			<div class="form-group">
				<label>number:</label>  <!-- 띄어쓰기가 안대... -->
				<input type="text" name="number1" value="<%=request.getParameter("number1") == null ? "0" : number %>" />
			</div>
			
			<div class="form-group">
				<input type="submit" class="btn btn-default" name="cmd" value="++">
				<input type="submit" class="btn btn-default" name="cmd" value="--">
			</div>
		</form>
	</div>
</body>
</html>