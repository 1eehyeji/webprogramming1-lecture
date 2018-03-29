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
		String s1 = "hello";
		String s2 = "world";

		out.println(s1);
		out.println(s2);
		out.println(s1 + s2);
		out.println("s1");
		out.println("s2");
		out.println("s1" + "s2");
		out.println("s1 + s2");
	%>
	<%=s1%>
	<%=s2%>
	<%=s1 + s2%>
	<%="s1"%>
	<%="s2"%>
	<%="s1" + "s2"%>
	<%="s1 + s2"%>
	</br> 4 x 7 =
	<%=4 * 7%>
	4 x 8 =
	<%=4 * 8%>
	4 x 9 =
	<%=4 * 9%>
	</br>
	<%
		int i = 4;
	%>
	4 x 7 =
	<%=i * 7%>
	4 x 8 =
	<%=i * 8%>
	4 x 9 =
	<%=i * 9%>
	</br>
	<%
		for (int ii = 1; ii <= 10; ++ii) {
			out.print("4 x " + ii);
			out.print(" = ");
			out.println(4 * ii);
		}
	%>
	</br>
	<table border=1>
		<tr>
			<%
				for (int iii = 1; iii <= 10; ++iii) {
					out.print("    ");
					out.print("<td>");
					out.print(iii);
					out.println("</td>");
				}
			%>
		</tr>
	</table>
	</br>
	<table border=1>
		<tr>
			<%
				for (int iiii = 1; iiii <= 10; ++iiii) {
					out.println("<td>" + iiii + "</td>");
				}
			%>
		</tr>
	</table>
	</br>
	<table border=1>
		<%
			for (int ij = 0; ij <= 3; ++ij) {
				out.println("<tr>");
				for (int j = 1; j <= 4; ++j) {
					out.println("<td>" + (ij * 4 + j) + "</td>");
				}
				out.println("</tr>");
			}
		%>
	</table>

</body>
</html>