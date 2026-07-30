<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String success = (String) session.getAttribute("success");

	if (success != null) {
	%>

	<div class="alert alert-success">
		<%=success%>
	</div>

	<%
	session.removeAttribute("success");
	}
	%>
</body>
</html>