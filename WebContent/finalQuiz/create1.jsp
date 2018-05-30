<%@page import="finalQuiz.boardDAO"%>
<%@page import="finalQuiz.boardDTO"%>
<%@page import="finalQuiz.userDTO"%>
<%@page import="finalQuiz.userDAO"%>
<%@page import="finalQuiz.ParseUtils"%>
<%@page import="finalQuiz.articleDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="finalQuiz.articleDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String 에러메시지 = null;

String pg = request.getParameter("pg");
String ss = request.getParameter("ss");
String st = request.getParameter("st");
if (ss == null) ss = "0";
if (st == null) st = "";
String stEncoded = URLEncoder.encode(st, "UTF-8");

String od = request.getParameter("od");
articleDTO article = new articleDTO();

if (request.getMethod().equals("GET")) {
	article.setNo(0);
	article.setTitle("");
	article.setBody("");
} else {
    article = new articleDTO();
    article.setNo(ParseUtils.parseInt(request.getParameter("no"), 0));
    article.setTitle(request.getParameter("title"));
    article.setUserId(ParseUtils.parseInt(request.getParameter("userid"), 0));
    article.setBody(request.getParameter("body"));
    article.setNotice(request.getParameter("notice") != null ? true : false);

	if (article.getNo() == 0) 
		에러메시지 = "no을 입력하세요";
	else if (article.getTitle() == null || article.getTitle().length() == 0) 
		에러메시지 = "제목을 입력하세요";
	else if (article.getBody() == null || article.getBody().length() == 0) 
		에러메시지 = "본문을 입력하세요";
	else {
        articleDAO.insert(article);
        response.sendRedirect("list1.jsp?pg=" + pg + "&ss=" + ss + "&st=" + stEncoded + "&od=" + od);
		return;
    }
}
%>
<!DOCTYPEhtml>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body { font-family: 굴림체; }
	select.form-control { width: 200px; }
</style>
</head>
<body>

	<div class="container">

	<h1>게시글 등록</h1>
	<hr />

	<form method="post"> 
		<div class="form-group"> 
			<label>no</label>
			<input type ="text" class="form-control" name="no"
				value="<%= article.getNo() %>" />
		</div>
		<div class="form-group"> 
			<label>제목</label>
			<input type ="text" class="form-control" name="title"
				value="<%= article.getTitle() == null ? "" : article.getTitle()  %>" />
		</div>
		<label>본문</label> 
		<div class="form-group"> 
			<textarea name="body" rows="20" cols="70"><%= article.getBody() == null ? "" : article.getBody()%></textarea>
		</div>	
		<div class="form-group"> 
			<label>작성자</label> 
			<select class="form-control" name="userid"> 
				<%for (userDTO u : userDAO.findAll()) { %>
				<% String selected = article.getUserId() == u.getId() ? "selected" : ""; %>
				<option value ="<%= u.getId() %>"<%= selected %>> 
					<%= u.getName() %>
				</option>
				<% } %> 
			</select>
		</div>
		<div class="form-group"> 
			<label>게시판</label> 
			<select class="form-control" name="boardid"> 
				<%for (boardDTO b : boardDAO.findAll()) { %>
				<% String selected = article.getBoardId() == b.getId() ? "selected" : ""; %>
				<option value ="<%= b.getId() %>"<%= selected %>> 
					<%= b.getBoardName() %>
				</option>
				<% } %> 
			</select>
		</div>
	<div class="form-group" style="margin-left: 20px;">
			<div class="checkbox">
        		<input type="checkbox" name="notice" value="1" <%= article.isNotice() ? "checked" : "" %>> 공지 <br/>
			</div>
	</div>
	
	<button type ="submit" class="btn btn-primary"> 
		<i class="glyphiconglyphicon-ok"></i>저장
	</button>

	<a href ="list1.jsp?pg=<%= pg %>&ss=<%= ss %>&st=<%=stEncoded%>&od=<%=od%>" class="btn btn-default"> 
		<i class="glyphiconglyphicon-list"></i>목록으로 
	</a>
	</form>

	<hr />
	<%if (에러메시지 != null) { %> 
	<div class ="alertalert-danger">
		게시글 등록 실패: <%=에러메시지%>
	</div>
	<% } %>
	</div>
</body>
</html>
