<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ page import="yourmed24.*"%>


<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Logout</title>
		<meta http-equiv="refresh" content="2;url=index.jsp" />
	</head>
<body>	
	<br>
	<br>
	<div class="container theme-showcase" role="main" style="width: 50%;">

		<div class="alert alert-success text-center" role="alert">You have successfully logged out</div>		

	</div>
</body>
</html>

<%@ include file="footer.jsp"%>