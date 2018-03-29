<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugu1</title>
</head>
<style>
table {
	border-collapse: collapse;
}

td {
	padding: 5px;
	border: solid 1px gray;
}
</style>
<body>

<table border=1>
<%
	for(int i = 1; i <= 9; ++i){
		
		out.println("<tr>");
		
		for(int j = 2; j <= 9; ++j){
			
			out.println("<td> " + j + " x " + i + " = " + (i*j) + "</td>");
			
		}
		
		out.println("</tr>");
	}
%>
</table>

</body>
</html>