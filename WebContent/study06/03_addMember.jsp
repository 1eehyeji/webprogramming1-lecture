<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="study06.MemberBean"></jsp:useBean>
<jsp:setProperty name="member" property="*"></jsp:setProperty>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>입력 완료된 회원 정보</h2>
<table>
	<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="member"/></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty property="userid" name="member"/></td>
	</tr>
	<tr>
		<td>별명</td>
		<td><jsp:getProperty property="nickname" name="member"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><jsp:getProperty property="pwd" name="member"/></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><jsp:getProperty property="email" name="member"/></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><jsp:getProperty property="phone" name="member"/></td>
	</tr>
</table>
</body>
</html>