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
	body { font-family: 굴림체; } 
	input.form-control, select.form-control { width: 200px; } 
</style>
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
<div class="container">
	<h1>학생등록 성공</h1>
	<hr />
	<div class="form-group">
		<table class="table table-bordered">
			<tr>
			<td>ID</td>
			<td><%= (String)session.getAttribute("id") %></td>
			</tr>
			<tr>
			<td>학번</td>
			<td><%= (String)session.getAttribute("studentNum") %></td>
			</tr>
			<tr>
			<td>이름</td>
			<td><%= (String)session.getAttribute("name") %></td>
			</tr>
			<tr>
			<td>학과ID</td>
			<td><%= (String)session.getAttribute("department") %></td>
			</tr>
			<tr>
			<td>학년</td>
			<td><%= (String)session.getAttribute("grade") %></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>