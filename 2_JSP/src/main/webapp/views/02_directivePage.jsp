<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- errorPage="error500.jsp" -->
<%@ page import="java.util.ArrayList, java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>page지시어</h1>
	
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("Servlet"); //0번째 인덱스	
		list.add("JSP"); // 1번째 인덱스
		

		Date today = new Date();
	%>
	
	현재날짜 및 시간 : <%=today%> <br>
	0번째 인덱스 : <%=list.get(0) %> <br>
	1번째 인덱스 : <%=list.get(1) %>
</body>
</html>