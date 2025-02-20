<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="appError.jsp" %>
<%
    Patient patient = (Patient)session.getAttribute("userPass");
    
    if (session.getAttribute("userPass") == null) {

        request.setAttribute("error_message", "You are not authorized to view this page.Please log in!");

%>
        <jsp:forward page="login.jsp" />

<%
    return;
}    
%>