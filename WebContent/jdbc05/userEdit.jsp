<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc02.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	String id = request.getParameter("id");
	User user = null;

	if (request.getMethod().equals("GET")) {
		user = UserDao.findOne(id);
	}else {
		user = new User();
		user.setId(Integer.parseInt(id));
		user.setUserid(request.getParameter("userid"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		String s2 = request.getParameter("departmentId");
   		user.setDepartmentId(Integer.parseInt(s2));
    	String s3 = request.getParameter("enabled");
    	user.setEnabled(Integer.parseInt(s3) == 1 ? true : false);
    	user.setUserType(request.getParameter("userType"));
	
		if (id == null || id.length() == 0) 
			에러메시지 = "ID를 입력하세요";
		else if (user.getName() == null || user.getName().length() == 0) 
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0) 
			에러메시지 = "이메일을 입력하세요";
		else if (s2 == null || s2.length() == 0) 
			에러메시지 = "학과를 선택하세요";
		else if (s3 == null || s3.length() == 0) 
			에러메시지 = "enabled를 선택하세요";
		else if (user.getUserType() == null || user.getUserType().length() == 0) 
			에러메시지 = "사용자 유형을 입력하세요";
		else {
			UserDao.update(user);
        	response.sendRedirect("userList.jsp?pg=" + request.getParameter("pg"));
			return;
		}
    }

%>
<!DOCTYPEhtml>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 굴림체;
}
input.form-control, select.form-control {
	width: 200px;
}
</style>
</head>
<body>

	<div class="container">

		<h1>학생등록</h1>
		<hr />
		<form method="post">
			<div class="form-group">
				<label>ID</label> <input type="text" class="form-control"
					name="userid" value="<%= user.getUserid() == null? "" : user.getUserid()%>" />
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" value="<%= user.getName() %>" />
			</div>
			<div class="form-group">
				<label>email</label> <input type="text" class="form-control"
					name="email" value="<%= user.getEmail() %>" />
			</div>
			<div class="form-group">
				<label>학과</label>
				<div class="radio">
        			<input type="radio" name="departmentId" value="4" 
        				<%= 4 == user.getDepartmentId() ? "checked" : "" %>>소프트웨어공학과 <br/>
        			<input type="radio" name="departmentId" value="3" 
        				<%= 3 == user.getDepartmentId() ? "checked" : "" %>>불어불문학 <br />
        			<input type="radio" name="departmentId" value="2"  
        				<%= 2 == user.getDepartmentId() ? "checked" : "" %>>영어영문학 <br />
        			<input type="radio" name="departmentId" value="1" 
        				<%= 1 == user.getDepartmentId() ? "checked" : "" %>>정보통신공학과 <br />
        			<input type="radio" name="departmentId" value="5" 
        				<%= 5 == user.getDepartmentId() ? "checked" : "" %>>컴퓨터공학과 <br/>
        			<input type="radio" name="departmentId" value="6" 
        				<%= 6 == user.getDepartmentId() ? "checked" : "" %>>정보통신공학과 <br/>
        			<input type="radio" name="departmentId" value="7" 
        				<%= 7 == user.getDepartmentId() ? "checked" : "" %>>글로컬IT공학과 <br/>
    			</div>
			</div>
			<div class="form-group">
				<label>enabled</label> <input type="text" class="form-control"
					name="enabled" value="<%= user.isEnabled()? "1" : "0" %>" />
			</div>
			<div class="form-group">
				<label>사용자 유형</label> <input type="text" class="form-control"
					name="userType" value="<%= user.getUserType() %>" />
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i>저장
			</button>
		</form>
		<hr />
<%
	if (에러메시지 != null) { 
%>
		<div class="alert alert-danger">
			학생등록실패:
			<%=에러메시지%>
		</div>
<%
	}
%>
	</div>
</body>
</html>
