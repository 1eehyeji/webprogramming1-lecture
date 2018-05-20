<%@page import="java.util.List"%>
<%@page import="web04_02.UserDao"%>
<%@page import="web04_02.User"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="web04_02.ParseUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;
	int pageSize = 10;
	
	request.setCharacterEncoding("utf-8");
	
	String pg = request.getParameter("pg");
	if(pg != null) currentPage = ParseUtils.parseInt(pg, 1);
	
	String srchText = request.getParameter("st");
	if(srchText == null) srchText = "";
	String srchTextEncoded = URLEncoder.encode(srchText, "utf-8");
	
	int recordCount = UserDao.count(srchText);
	
	int lastPage = Math.max(1, (recordCount + pageSize - 1) / pageSize);
	if (currentPage > lastPage) currentPage = lastPage;
	
	String od = request.getParameter("od");
	if (od == null) od = "0";
	List<User> list = UserDao.findByName(srchText, currentPage, pageSize, od);
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
		href="userCreate1.jsp?pg=<%=currentPage%>&st=<%=srchTextEncoded%>&od=<%=od%>">
		<i class="glyphicon glyphicon-plus"></i>사용자 등록
	</a>

	<form class="form-inline">
		<div class="form-group">
			<label>정렬</label>
			<select name="od"class="form-control">
				<option value="0"<%="0".equals(od) ? "selected" : ""%>>등록순서</option>
				<option value="1"<%="1".equals(od) ? "selected" : ""%>>학과</option>
				<option value="2"<%="2".equals(od) ? "selected" : ""%>>동의여부</option>
			</select>
			<label>이름</label>
			<input type="text"class="form-control"name="st"value="<%= srchText %>"
				placeholder="검색조건"/>
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
			<tr data-url="userEdit1.jsp?id=<%=user.getId()%>&pg=<%=currentPage%>&st=<%=srchTextEncoded%>&od=<%=od%>">
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