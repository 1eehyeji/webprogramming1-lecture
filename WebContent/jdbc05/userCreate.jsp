<%@page import="jdbc02.UserDao"%>
<%@page import="jdbc02.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	User user = new User();

	if (request.getMethod().equals("GET")) {
		user.setUserid("");
		user.setName("");
		user.setPassword("");
		user.setEmail("");
		user.setDepartmentId(-1);
		user.setUserType("");
	} else {
		user = new User();
		user.setUserid(request.getParameter("userid"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
    	String s2 = request.getParameter("departmentId");
    	user.setDepartmentId(Integer.parseInt(s2));
    	user.setUserType(request.getParameter("userType"));

    	if (user.getUserid() == null || user.getUserid().length() == 0) 
			에러메시지 = "ID를 입력하세요";
		else if (user.getName() == null || user.getName().length() == 0) 
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0) 
			에러메시지 = "이메일을 입력하세요";
		else if (s2 == null || s2.length() == 0) 
			에러메시지 = "학과를 선택하세요";
		else if (user.getUserType() == null || user.getUserType().length() == 0) 
			에러메시지 = "사용자 유형을 입력하세요";
		else {
			UserDao.insert(user);
        	response.sendRedirect("userList.jsp?pg=99999");
			return;
    }
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body { font-family: 굴림체; }
input.form-control,select.form-control { width: 200px; }
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">

	<h1>학생등록</h1>
	<hr/>

	<form method="post">
		<div class="form-group">
			<label> I D </label>
			<input type="text"class="form-control"name="userid"
				value="<%= user.getUserid() %>"/>
		</div>
		<div class="form-group">
			<label> 이름 </label>
			<input type="text"class="form-control"name="name"value="<%= user.getName() %>"/>
		</div>
		<div class="form-group">
			<label> P W </label>
			<input type="password"class="form-control"name="password"value="<%= user.getPassword() %>"/>
		</div>
		<div class="form-group">
			<label> Email </label>
			<input type="text"class="form-control"name="email"value="<%= user.getEmail() %>"/>
		</div>
		<div class="form-group">
			<label>학과</label>
			<select class="form-control" name="departmentId">
				<option value="1" <%=user.getDepartmentId() == 1 ? "selected" : "" %>>국어국문학</option>
				<option value="2" <%=user.getDepartmentId() == 2 ? "selected" : "" %>>영어영문학</option>
				<option value="3" <%=user.getDepartmentId() == 3 ? "selected" : "" %>>불어불문학</option>
				<option value="4" <%=user.getDepartmentId() == 4 ? "selected" : "" %>>소프트웨어공학과</option>
				<option value="5" <%=user.getDepartmentId() == 5 ? "selected" : "" %>>컴퓨터공학과</option>
				<option value="6" <%=user.getDepartmentId() == 6 ? "selected" : "" %>>정보통신공학과</option>
				<option value="7" <%=user.getDepartmentId() == 7 ? "selected" : "" %>>글로컬IT공학과</option>
			</select>
		</div>
		<div class="checkbox">
		 		<input type="checkbox" name="userType" value="관리자" <%= user.getUserType().equals("관리자") ? "checked" : "" %>>관리자 <br/>
        		<input type="checkbox" name="userType" value="교수" <%= user.getUserType().equals("교수") ? "checked" : "" %>>교수 <br/>
        		<input type="checkbox" name="userType" value="학생" <%= user.getUserType().equals("학생") ? "checked" : "" %>>학생
			</div>
		<button type="submit"class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i>저장
		</button>
	</form>

	<hr/>
	<%if (에러메시지 != null) { %>
	<div class="alert alert-danger">
		사용자 등록 실패: <%=에러메시지%>
	</div>
	<% } %>
</div>
</body>
</html>