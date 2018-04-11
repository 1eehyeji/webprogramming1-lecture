<%@page import="jsp01.Student"%>
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

	int id = -1;
	String studentNum = "";
	String name = "";
	int department = -1;
	int grade = -1;
	String error = null;

	if (request.getMethod().equals("POST")) {
		
		id = Integer.parseInt(request.getParameter("id").length() == 0 ? "-1" : request.getParameter("id"));
		studentNum = request.getParameter("studentNum");
		name = request.getParameter("name");
		department = Integer.parseInt(request.getParameter("department").length() == 0 ? "-1" : request.getParameter("department"));
		grade = Integer.parseInt(request.getParameter("grade").length() == 0 ? "-1" : request.getParameter("grade"));
		
		Student std = new Student(id, studentNum, name, department, grade);

		if (id == -1) {
			error = "아이디를 입력하세요";
		} else if (studentNum == null || studentNum.length() == 0) {
			error = "학번을 입력하세요";
		} else if (name == null || name.length() == 0) {
			error = "이름을 입력하세요";
		} else if (department == -1) {
			error = "학과를 선택하세요";
		} else if (grade == -1) {
			error = "학년을 입력하세요";
		}else{
			session.setAttribute("std", std);
			response.sendRedirect("student_success.jsp");
			return;
		}
	}
%>
<body>
<div class="container">
<h1>학생 등록</h1>
<hr>
<form method="post">
	<div class="form_group">
	<label>ID</label>
	<input type="text" class="form-control" name="id" value="<%= id == -1? "" : id%>">
	</div>
	
	<div class="form_group">
	<label>학번</label>
	<input type="text" class="form-control" name="studentNum" value="<%= studentNum == null? "" : studentNum%>">
	</div>
	
	<div class="form_group">
	<label>이름</label>
	<input type="text" class="form-control" name="name" value="<%= name == null? "" : name%>">
	</div>
	
	<div class="form_group">
	<label>학과</label>
	<select class="form-control" name="department">
		<option value="1" <%=department == 1 ? "selected" : "" %>>소프트웨어공학과</option>
		<option value="2" <%=department == 2 ? "selected" : "" %>>컴퓨터공학과</option>
		<option value="3" <%=department == 3 ? "selected" : "" %>>정보통신학과</option>
		<option value="4" <%=department == 4 ? "selected" : "" %>>글로컬IT공학과</option>
	</select>
	</div>
	
	<div class="form_group">
	<label>학년</label>
	<input type="text" class="form-control" name="grade" value="<%= grade == -1 ? "" : grade%>">
	</div>
	
	<br>
	<div class="form_group">
	<input type="submit" class="btn btn-primary" name="save" value="저장">
	</div>
<hr>
<%
	if(error != null){
%>
	<div class="alert alert-danger" role="alert" >
		학생등록 실패: <%= error %>
	</div>
<%
	}
%>
</form>
</div>
</body>

</html>