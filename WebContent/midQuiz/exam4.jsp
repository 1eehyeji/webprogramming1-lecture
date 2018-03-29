<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 굴림체;
}

input.form-control {
	width: 200px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action='exam4.jsp' method="get">

			<div class="form-group">
				<label>number1:</label> <input type="text" name="param1"
					class="form-control"
					value="<%
						if(request.getParameter("param1") == null)
							out.print(0);
						else{
							int i = Integer.parseInt(request.getParameter("param1"));
							out.print(++i);
						}
							%>" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" name="cmd" value="확인">
			</div>

		</form>
	</div>
</body>
</html>