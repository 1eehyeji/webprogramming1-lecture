<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugu3</title>
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
	<table>
		<%
			out.print("<tr>");
			for(int i = 2; i<6; ++i){
				out.print("<td>");
				for(int j = 1; j<10; ++j){
					out.print(i + "x" + j + "=" + (i*j) + "</br>");
				}
				out.print("</td>");
			}
			out.print("</tr>");
			
			out.print("<tr>");
			for(int i = 6; i<10; ++i){
				out.print("<td>");
				for(int j = 1; j<10; ++j){
					out.print(i + "x" + j + "=" + (i*j) + "</br>");
				}
				out.print("</td>");
			}
			out.print("</tr>");
		%>
	</table>
</body>
</html>