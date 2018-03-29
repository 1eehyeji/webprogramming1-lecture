<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		for (int i = 8; i <= 30; i += 2) {
			out.println("<div style='font-size:" + i + "pt;'>");
			out.println("     안녕  jsp!" + i + "pt");
			out.println("</div>");
		}
	%>
	
</body>
</html>