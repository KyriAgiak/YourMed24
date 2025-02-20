<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ include file="authentication.jsp"%>
<% 
    String appStr=request.getParameter("app");
    int appId=Integer.parseInt(appStr);
    Appointment.cancelAppointment(appId);
    request.setAttribute("successMessage", "Appointment deleted successfully!");    
%>
    <jsp:forward page="my-appointments.jsp"/>