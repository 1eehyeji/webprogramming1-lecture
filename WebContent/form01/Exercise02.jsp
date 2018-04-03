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
<title>form01_Exercise02</title>
</head>
<body>
	<div class=container>
		<form method="get">
			<div class="form-group">
				<label>select1:</label> 
				<select name="cmd" class="form-control">
					<option value="one" <%="one".equals(request.getParameter("cmd")) ? "selected" : "" %>>one</option>
					<option value="two" <%="two".equals(request.getParameter("cmd")) ? "selected" : "" %>>two</option>
					<option value="three" <%="three".equals(request.getParameter("cmd")) ? "selected" : "" %>>three</option>
				</select>
			</div>
			
			<div class="form-group">
				<div class="radio">
					<label><input type="radio" name="radio1" value="one" <%="one".equals(request.getParameter("cmd")) ? "checked" : "" %> />one</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="radio2" value="two" <%="two".equals(request.getParameter("cmd")) ? "checked" : "" %>/>two</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="radio3" value="three" <%="three".equals(request.getParameter("cmd")) ? "checked" : "" %>/>three</label>
				</div>
			</div>
			
			<div class="form-group">
				<input type="text" name="text1" value="<%=request.getParameter("cmd") == null ? "" : request.getParameter("cmd")%>" />
			</div>
			<div class="form-group"> 
				<button type="submit" class="btn btn-primary">확인</button> 
			</div>
		</form>
	</div>
</body>
</html>