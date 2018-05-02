<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>세션에 설정된 모든 값 얻어오기</h3>
<%
	//Enmeration 인터페이스 객체를 만들어서 세션에 들어 있는 모든 이름에 대한 정보를 저장
	//Enumeration는 여러 개의 데이터를 집합처럼 관리하는 인터페이스
	Enumeration names = session.getAttributeNames();

	// hasMoreElements() 객체에 뽑아올 데이터가 있는지 검사하여 true / false
	while(names.hasMoreElements()){
		
		// nextElements() 다음 아이템이 존재한다는 전제 하에서 아이템을 하나씩 뽑아옴
		String name = names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name + " : " + value + "<br/>");
		
	}
%>
</body>
</html>