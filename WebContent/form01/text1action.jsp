<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<metaname ="viewport"content="width=device-width, initial-scale=1">
<linkrel
	="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<scriptsrc="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script> <scriptsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<style>
table.table {
	width: 500px;
}

thead tr {
	background-color: #eee;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%
			request.setCharacterEncoding("utf-8"); //request하기 전에 꼭 해줘야함! 안하면 한글이 깨져서 나옴
		%>

		<h1>request parameter</h1>
		
		<table class="tabletable-bordered">
		
			<thead>
				<tr>
					<th>Parameter Name</th>
					<th>Parameter Value</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>param1</td>
					<td><%=request.getParameter("param1")%></td>
				</tr>
				<tr>
					<td>param2</td>
					<td><%=request.getParameter("param2")%></td>
				</tr>
				<tr>
					<td>cmd</td>
					<td><%=request.getParameter("cmd")%></td>
				</tr>
				<tr>
					<td>method</td>
					<td><%=request.getMethod()%></td>
				</tr>
			</tbody>
			
		</table>
	</div>
</body>
</html>