<%@page import="midExam.Product"%>
<%@page import="java.util.List"%>
<%@page import="midExam.ProductDao"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
	int pageSize = 10;
	int currentPage = 1;
	int recordCount = ProductDao.count();
	String pg = request.getParameter("pg");
	if(pg != null) 
		currentPage = Integer.parseInt(pg);
	
	List<Product> list = ProductDao.findAll(currentPage, pageSize);
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
<title>product2</title>
</head>
<body>

<div class="container">
<h1>제품목록</h1>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id</th>
			<th>제품명</th>
			<th>카테고리</th>
			<th>가격</th>
			<th>수량</th>
		</tr>
	</thead>
	<tbody>
		<% for(Product prdt : list){ %>
			<tr>
				<td><%=prdt.getId() %></td>
				<td><%=prdt.getTitle() %></td>
				<td><%=prdt.getCategoryName() %></td>
				<td><%=prdt.getUnitCost() %></td>
				<td><%=prdt.getQuantity() %></td>
			</tr>
			<%} %>
	</tbody>
</table>
<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />
</div>
</body>
</html>