<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userID = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
String loginCheck = request.getParameter("loginCheck");

if(loginCheck.equals("user")){
%>
<jsp:forward page="09_userMain.jsp">
<jsp:param value='<%= URLEncoder.encode("낑고객", "UTF-8") %>' name="userName" />
</jsp:forward>
<%}else{ %>
<jsp:forward page="09_managerMain.jsp">
<jsp:param value='<%= URLEncoder.encode("깡관리", "UTF-8") %>' name="userName" />
</jsp:forward>
<% } %>