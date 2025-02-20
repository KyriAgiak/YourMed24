<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page errorPage="appError.jsp"%>


<%  
    String doctorStr = request.getParameter("id");
    if (doctorStr == null) {
        request.setAttribute("message-no-param", "No parameters specified.You have to choose a doctor!");
    %>  
        <jsp:forward page="index.jsp"/>
    <%   }

    int doctor_id = Integer.parseInt(doctorStr);
    List<Review> reviews = new ArrayList<Review>();
    reviews = Review.getReview(doctor_id);
    int rating = 0;
    
    if (reviews.size() != 0 ) {
        for (Review review : reviews) {
        rating = rating + review.getRate();
        }
    rating = rating / reviews.size();
    }
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> Reviews | YourMed24</title>
</head>
<body>
<% 
    Patient patient =(Patient)session.getAttribute("userPass");
    if (session.getAttribute("userPass") == null) {
%>
        <header>
            <div class="header-logo">
                <img src="images/YourMed24_logo.png" alt="Your Logo">
            </div>
            <div class="header-login">
            <a href="login.jsp">Login</a>
            <a href="registration.jsp">Register</a>
            </div>
        </header>
<%  }
    if (session.getAttribute("userPass") != null) {
    %>    <%@ include file="logo-profile-button.jsp"%>
<% }
%>
<body>
    <center>
<%
    if (reviews.size() == 0 ) {
%>     <h3><center>No reviews yet</center><br></h3>
<% 
    } else {
%>  <br>
    <h3>here you can see all the reviews</h3>
    <div class="offcanvas offcanvas-start show" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
    <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasLabel">Total Rating: <%=rating%> stars</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
<%  
    for (Review review : reviews) {
%>        
    <div class="offcanvas-body">
    <b> <%= dateFormat.format(review.getDate()) %><br>
        <%=review.getPatient().getName() %>: </b>
        <%=review.getComment()%><br>
        <br>
    </div>       
<%   
    }
    }
%>
    </div>
    </center>
</body>
<%@ include file="footer.jsp"%>
