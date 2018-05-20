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
	
	String srchText = ss.equals("3") ? st1 : st2;
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
		<input type="hidden" name="ss" value="3"/>
		<div class="form-group">
			<div class="radio">
        		<input type="radio" name="st1" value="1" <%= st1.equals("1") ? "checked" : "" %>>동의
        		<input type="radio" name="st1" value="0" <%= st1.equals("0") ? "checked" : ""  %>>비동의
    		</div>
		</div>
		<button type="submit"class="btn btn-primary">조회</button>
	</form>
	<form class="form-inline">
		<input type="hidden" name="ss" value="4"/>
		<div class="form-group">
			<div class="checkbox">
        		<input type="checkbox" name="st2" value="관리자" <%= st2.equals("관리자") ? "checked" : "" %>> 관리자 
        		<input type="checkbox" name="st2" value="교수" <%= st2.equals("교수") ? "checked" : "" %>> 교수 
        		<input type="checkbox" name="st2" value="학생" <%= st2.equals("학생") ? "checked" : "" %>> 학생 
			</div>
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