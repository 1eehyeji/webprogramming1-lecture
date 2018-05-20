<%@page import="web04_02.UserDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="web04_02.ParseUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s1 = request.getParameter("id");
	int id = ParseUtils.parseInt(s1, 0);
	String pg = request.getParameter("pg");
	String srchText = request.getParameter("st");
	
	if (srchText == null) srchText = "";
		String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8");
		
	String od = request.getParameter("od");

	UserDao.delete(id);
	response.sendRedirect("userList1.jsp?pg=" + pg + "&st=" + srchTextEncoded + "&od=" + od);
%>