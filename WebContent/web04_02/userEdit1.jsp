<%@page import="web04_02.DepartmentDAO"%>
<%@page import="web04_02.Department"%>
<%@page import="web04_02.UserDao"%>
<%@page import="web04_02.User"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="web04_02.ParseUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id = ParseUtils.parseInt(s1, 0);

	String pg = request.getParameter("pg");
	String srchText = request.getParameter("st");
	if (srchText == null) srchText = "";
	String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8");

	String od = request.getParameter("od");
	User user = null;

	if (request.getMethod().equals("GET")) {
    	user = UserDao.findOne(id);
	}
	else {
		user = new User();
		user.setId(id);
		user.setUserid(request.getParameter("userid"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
    	String s2 = request.getParameter("departmentId");
    	user.setDepartmentId(ParseUtils.parseInt(s2, 1));
    	boolean b1 = request.getParameter("enabled").equals("1") ? true : false;
    	user.setEnabled(b1);
    	user.setUserType(request.getParameter("usertype"));
	
		if (user.getUserid() == null || user.getUserid().length() == 0) 
			에러메시지 = "ID를입력하세요";
		else if (user.getName() == null || user.getName().length() == 0) 
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0) 
			에러메시지 = "Email을 입력하세요";
		else {
        	UserDao.update(user);
        	response.sendRedirect("userList1.jsp?pg=" + pg + "&st=" + srchTextEncoded + "&od=" + od);
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
			<label> ID </label>
			<input type="text" class="form-control" name="userid" value="<%= user.getUserid() %>"/>
		</div>
		
		<div class="form-group">
			<label> 이름 </label>
			<input type="text"class="form-control" name="name" value="<%= user.getName() %>"/>
		</div>
		
		<div class="form-group">
			<label> Email </label>
			<input type="text"class="form-control" name="email" value="<%= user.getEmail() %>"/>
		</div>
		
		<div class="form-group">
			<label> 학과 </label>
			<select class="form-control"name="departmentId">
				<%for (Department d : DepartmentDAO.findAll()) { %>
					<% String selected = user.getDepartmentId() == d.getId() ? "selected" : ""; %>
					<option value="<%= d.getId() %>"<%= selected %>>
						<%= d.getDepartmentName() %>
					</option>
				<% } %>
			</select>
		</div>
		
		<div class="form-group">
			<label> 동의여부 </label>
			<div class="radio">
        		<input type="radio" name="enabled" value="1" <%= user.isEnabled() ? "checked" : "" %>>동의 <br/>
        		<input type="radio" name="enabled" value="0" <%= !user.isEnabled() ? "checked" : "" %>>비동의
    		</div>
		</div>
		
		<div class="form-group">
			<label> 사용자유형 </label>
			<select class="form-control"name="usertype">
				<option value="관리자" 
					<%=user.getUserType().equals("관리자") ? "selected" : "" %>>관리자
				</option>
				<option value="교수"
					<%=user.getUserType().equals("교수") ? "selected" : "" %>>교수
				</option>
				<option value="학생"
					<%=user.getUserType().equals("학생") ? "selected" : "" %>>학생
				</option>
			</select>
		</div>
		
		<button type="submit"class="btn btn-primary">
			<i class="glyphicon glyphicon-ok"></i>저장
		</button>
		
		<a href="userDelete1.jsp?id=<%= id %>&pg=<%= pg %>&st=<%= srchTextEncoded %>&od=<%=od%>"
			class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')">
			<i class="glyphicon glyphicon-trash"></i>삭제
		</a>
		
		<a href="userList1.jsp?pg=<%= pg %>&st=<%= srchTextEncoded %>&od=<%=od%>"
			class="btn btn-default">
			<i class="glyphicon glyphicon-list"></i>목록으로
		</a>
	</form>

	<hr/>
	<%if (에러메시지 != null) { %>
		<div class="alert alert-danger">
			학생등록실패: <%= 에러메시지 %>
		</div>
	<% } %>
</div>
</body>
</html>