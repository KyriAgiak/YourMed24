<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page errorPage="appError.jsp"%>

<%@ include file="authentication.jsp"%>

<%  
    String idStr=request.getParameter("doctor_id");
    int doctor_id = Integer.parseInt(idStr);
    String ratingStr = request.getParameter("rating");
    int rating = Integer.parseInt(ratingStr);
    String new_review = request.getParameter("review");
    Timestamp date = new Timestamp(System.currentTimeMillis());
    Review review = new Review(date, rating, new_review, patient.getId(), doctor_id);
    Review.addReview(review);
    request.setAttribute("successReview","review added successfully!");
%>  
    <jsp:forward page="profile-home.jsp" />