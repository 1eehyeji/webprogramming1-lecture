<%@page import="web04_03.DepartmentDAO"%>
<%@page import="web04_03.Department"%>
<%@page import="java.util.List"%>
<%@page import="web04_03.UserDao"%>
<%@page import="web04_03.User"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="web04_03.ParseUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;
	int pageSize = 10;
	
	request.setCharacterEncoding("utf-8");
	
	String pg = request.getParameter("pg");
	if(pg != null) currentPage = ParseUtils.parseInt(pg, 1);
	
	String st1 = request.getParameter("st1");
	String st2 = request.getParameter("st2");
	if(st1 == null) st1 = "";
	if(st2 == null) st2 = "";
	
	String ss = request.getParameter("ss");
	if(ss == null) ss = "0";
	
	String srchText = ss.equals("1") ? st1 : st2;
	if(srchText == null) srchText = "";
	String srchTextEncoded = URLEncoder.encode(srchText, "utf-8");
	
	int recordCount = UserDao.count(ss, srchText);
	
	int lastPage = Math.max(1, (recordCount + pageSize - 1) / pageSize);
	if (currentPage > lastPage) currentPage = lastPage;
	
	String od = "0";
	List<User> list = UserDao.findAll(currentPage, pageSize, ss, srchText, od);
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
	thead th { background-color: #eee; }
	tr:hover td { background-color: #ffe; cursor: pointer; }
	table.table { margin-top: 5px; }
	select { margin-right: 20px; }
</style>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>사용자 목록</h1>

	<a id="createButton" class="btn btn-primary pull-right"
		href="userCreate2.jsp?pg=<%=currentPage%>&ss=<%=ss %>&st=<%=srchTextEncoded%>&od=<%=od%>">
		<i class="glyphicon glyphicon-plus"></i>사용자 등록
	</a>

	<form class="form-inline">
		<input type="hidden" name="ss" value="1"/>
		<div class="form-group">
		<label> 이름 </label>
			<input type="text" class="form-control" name="st1" value="<%= st1 == null ? "" : st1 %>"
				placeholder="검색조건"/>
		</div>
		<button type="submit"class="btn btn-primary">조회</button>
	</form>
	<form class="form-inline">
		<input type="hidden" name="ss" value="2"/>
		<div class="form-group">
			<label> 학과 </label>
			<select class="form-control" name="st2">
				<option value="" <%=st2.equals("")? "selected" : "" %>>전체</option>
				<option value="국어국문학" <%=st2.equals("국어국문학")? "selected" : "" %>>국어국문학</option>
				<option value="영어영문학" <%=st2.equals("영어영문학") ? "selected" : "" %>>영어영문학</option>
				<option value="불어불문학" <%=st2.equals("불어불문학") ? "selected" : "" %>>불어불문학</option>
				<option value="소프트웨어공학과" <%=st2.equals("소프트웨어공학과") ? "selected" : "" %>>소프트웨어공학과</option>
				<option value="컴퓨터공학과" <%=st2.equals("컴퓨터공학과") ? "selected" : "" %>>컴퓨터공학과</option>
				<option value="정보통신공학과" <%=st2.equals("정보통신공학과") ? "selected" : "" %>>정보통신공학과</option>
				<option value="글로컬IT공학과" <%=st2.equals("글로컬IT공학과") ? "selected" : "" %>>글로컬IT공학과</option>
			</select>
		</div>
		<button type="submit"class="btn btn-primary">조회</button>
	</form>
	<table class="table table-bordered table-condensed">
		<thead>
			<tr>
				<th> ID </th>
				<th> 이름 </th>
				<th> 학과 </th>
				<th> 동의여부 </th>
				<th> 사용자유형 </th>
			</tr>
		</thead>
		<tbody>
			<%for (User user : list) { %>
			<tr data-url="userEdit2.jsp?id=<%=user.getId()%>&pg=<%=currentPage%>&ss=<%=ss %>&st=<%=srchTextEncoded%>&od=<%=od%>">
				<td><%= user.getUserid() %></td>
				<td><%= user.getName() %></td>
				<td><%= user.getDepartmentName() %></td>
				<td><%= user.isEnabled() %></td>
				<td><%= user.getUserType() %>
			</tr>
			<% } %>
		</tbody>
	</table>

<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg"/>

</div>
<script>
	$("[data-url]").click(function() {
	var url = $(this).attr("data-url");
    location.href = url;
	})
</script>
</body>
</html>