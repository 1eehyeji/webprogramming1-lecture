<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="msg" value="hello"></c:set>
\${msg} = ${msg}<br />
<c:set var="age">
	30
</c:set>
\${age} = ${age} <hr>

<c:set var="member" value="<%= new study06.MemberBean() %>"></c:set>
<c:set target="${member}" property="name" value="낑깡"></c:set>
<c:set target="${member}" property="userid" value="lwii"></c:set>
\${member} = ${member} <hr>

<c:set var="add" value="${10 + 5 }"></c:set>
\${add} = ${add} <hr>
<c:set var="flag" value="${10 > 5 }"></c:set>
\${flag} = ${flag} <hr>
</body>
</html>