<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>

<%@ include file="authentication.jsp"%>

<%    
    String delete_string=request.getParameter("delete");
    int  delete_patient= Integer.parseInt(delete_string);
    Patient.deletePatient(delete_patient);
    session.invalidate();
    request.setAttribute("delete-message","Your account have been deleted succesfully");
%>  <jsp:forward page="login.jsp"/>



