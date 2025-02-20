<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp" %>



<% 
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    try {
        Patient patient = Patient.login(email, password);
        session.setAttribute("userPass", patient);
        if (session.getAttribute("userPass") == null) {
             request.setAttribute("error_message", "You are not authorized to view this page.Please log in!");
        %>   <jsp:forward page="login.jsp" />
        <% } response.sendRedirect("profile-home.jsp");   
    } catch (Exception e) {
        request.setAttribute("error_message", e.getMessage());
%>
        <jsp:forward page="login.jsp"/>
<%
 }
%>