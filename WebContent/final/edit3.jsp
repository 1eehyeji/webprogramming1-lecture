<%@page import="f201632025.BookDAO"%>
<%@page import="f201632025.PublisherDAO"%>
<%@page import="f201632025.Publisher"%>
<%@page import="f201632025.CategoryDAO"%>
<%@page import="f201632025.Category"%>
<%@page import="f201632025.ParseUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="f201632025.Book"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String 에러메시지 = null;
String s1 = request.getParameter("id");
int id = ParseUtils.parseInt(s1, 0);

String pg = request.getParameter("pg");
String ss = request.getParameter("ss");
String st = request.getParameter("st");
if (ss == null) ss = "0";
if (st == null) st = "";
String stEncoded = URLEncoder.encode(st, "UTF-8");

Book book = null;

if (request.getMethod().equals("GET")) {
    book = BookDAO.findOne(id);
} else {
    book = new Book();
    book.setId(id);
    book.setTitle(request.getParameter("title"));
    book.setAuthor(request.getParameter("author"));
    book.setCategoryid(ParseUtils.parseInt(request.getParameter("categoryid"), 0));
    book.setPrice(ParseUtils.parseInt(request.getParameter("price"), 0));
    book.setPublisherid(ParseUtils.parseInt(request.getParameter("publisherid"), 0));
    boolean b = request.getParameter("available") != null ? true : false;
    book.setAvailable(b);
	if (book.getTitle() == null || book.getTitle().length() == 0) 
		에러메시지 = "제목을 입력하세요";
	else if (book.getAuthor() == null || book.getAuthor().length() == 0) 
		에러메시지 = "저자를 입력하세요";
	else if (book.getPrice() == 0) 
		에러메시지 = "가격을 입력하세요";
else {
        BookDAO.update(book);
        response.sendRedirect("list3.jsp?pg=" + pg + "&ss=" + ss + "&st=" + stEncoded);
return;
    }
}
%>
<!DOCTYPEhtml>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body { font-family: 굴림체; }
input.form-control,select.form-control { width: 200px; }
</style>
</head>
<body>

<div class="container">

<h1>책 수정</h1>
<hr/>

<form method="post">
<div class="form-group">
<label>제목</label>
<input type="text" class="form-control" name="title" value="<%= book.getTitle() %>"/>
</div>

<div class="form-group">
<label>저자</label>
<input type="text" class="form-control" name="author" value="<%= book.getAuthor() %>"/>
</div>

<div class="form-group">
<label>카테고리</label>
<select class="form-control" name="categoryid">
<%for (Category c : CategoryDAO.findAll()) { %>
<% String selected = book.getCategoryid() == c.getId() ? "selected" : ""; %>
<option value="<%= c.getId() %>"<%= selected %>>
<%= c.getCategoryName() %>
</option>
<% } %>
</select>
</div>

<div class="form-group">
<label>출판사</label>
<select class="form-control" name="publisherid">
<%for (Publisher p : PublisherDAO.findAll()) { %>
<% String selected = book.getPublisherid() == p.getId() ? "selected" : ""; %>
<option value="<%= p.getId() %>"<%= selected %>>
<%= p.getTitle() %>
</option>
<% } %>
</select>
</div>

<div class="form-group">
<label>가격</label>
<input type="number" class="form-control" name="price" value="<%= book.getPrice() %>"/>
</div>

<div class="form-group" style="margin-left: 20px;">
	<div class="checkbox">
        <input type="checkbox" name="available" value="1" <%= book.isAvailable() ? "checked" : "" %>>대여가능<br/>
	</div>
</div>
		
<button type="submit" class="btn btn-primary">
<i class="glyphicon glyphicon-ok"></i>저장
</button>
<a href="delete1.jsp?id=<%= id %>&pg=<%= pg %>&ss=<%=ss%>&st=<%=stEncoded%>"
class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')">
<i class="glyphicon glyphicon-trash"></i>삭제
</a>
<a href="list4.jsp?pg=<%= pg %>&ss=<%= ss %>&st=<%=stEncoded%>"
class="btn btn-default">
<i class="glyphicon glyphicon-list"></i>목록으로
</a>
</form>

<hr/>
<%if (에러메시지 != null) { %>
<div class="alert alert-danger">
저장실패: <%=에러메시지%>
</div>
<% } %>
</div>
</body>
</html>
