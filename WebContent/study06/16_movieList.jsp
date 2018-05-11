<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	String[] movieList = {"어벤져스", "스파이더맨", "블랙팬서", "토르"};
	pageContext.setAttribute("movieList", movieList);
%>
<ul>
	<c:forEach var="movie" items="${movieList}" varStatus="status">
		<c:choose>
			<c:when test="${status.first }">
				<li style="font-weight: bold; color:red;">${movie }</li>
			</c:when>
			<c:otherwise>
				<li>${movie }</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>

<c:forEach var="movie" items="${movieList }" varStatus="status">
	${movie} <c:if test="${!status.last }"> , </c:if>
</c:forEach>
</body>
</html>