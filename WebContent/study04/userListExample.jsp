
<%@page import="java.util.Arrays"%>
<%@page import="jdbc02.UserDao"%>
<%@page import="jdbc02.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	List<User> list = UserDao.findAll();
	String enabled = "";
	String[] userType = null;
	
	request.setCharacterEncoding("UTF-8");
	
    if (request.getMethod().equals("POST")) {
        enabled = request.getParameter("enabled");
        userType = request.getParameterValues("userType");
        
        switch (request.getParameter("bnt")) {
        case "radio":
            list = UserDao.findByEnable(enabled);
            break;
        case "checkbox":
            list = UserDao.findByUserType(userType);
            break;
        }
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style> 
	body { font-family: 굴림체; } 
	thead th { background-color: #eee; } 
	table.table { width: 700px; } 
</style>
<title>Insert title here</title>
</head>
<body>
<form method="post">
<div class="container">
	<h1>사용자 목록</h1>
	<div class="radio">
        <input type="radio" name="enabled" value="1" <%= "1".equals(enabled) ? "checked" : "" %>>1 <br/>
        <input type="radio" name="enabled" value="0" <%= "0".equals(enabled) ? "checked" : "" %>>0
    </div>
	<div class="form-group">
		<button type="submit" name="bnt" value="radio" class="btn btn-primary">조회</button>
	</div>
	<div class="checkbox">
	  <% 
            if (userType == null) userType = new String[0];
            List<String> types = Arrays.asList(userType); 
        %>
		 <input type="checkbox" name="userType" value="관리자" <%= types.contains("관리자") ? "checked" : "" %>>관리자 <br/>
        <input type="checkbox" name="userType" value="교수" <%= types.contains("교수") ? "checked" : "" %>>교수 <br/>
        <input type="checkbox" name="userType" value="학생" <%= types.contains("학생") ? "checked" : "" %>>학생
	</div>
	<div class="form-group">
		<button type="submit" name="bnt" value="checkbox" class="btn btn-primary">조회</button> </br>
	</div>

<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>학과</th>
			<th>enabled</th>
			<th>사용자 유형</th>
		</tr>
	</thead>
	<tbody>
		<% for(User user : list){ %>
			<tr>
				<td><%=user.getUserid() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getDepartmentName() %></td>
				<td><%=user.isEnabled() ? "1" : "0" %></td>
				<td><%=user.getUserType() %></td>
			</tr>
			<% } %>
	</tbody>
</table>
</div>
</form>
</body>
</html>