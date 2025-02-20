<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page errorPage="appError.jsp" %>


<%  
    String specialty = request.getParameter("category");
    String address = request.getParameter("location");
    if (specialty == null && address== null) {
        request.setAttribute("message-no-param", "No parameters specified.You have to choose a doctor!");
%>      <jsp:forward page="index.jsp"/>
<%   }
    List<Doctor> doctors = new ArrayList<Doctor>();
    doctors = Doctor.getDoctors(specialty, address);  
%>
<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> Doctors | YourMed24</title>
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

    if (doctors.size() == 0 ) {
 %>     <h2><center>Sorry no doctors met the criteria</center><br></h2>
 <% } else {
 %>   <h2><center><%=doctors.size()%> doctors</center><br></h2>
<%  } 
%>      <a href="index.jsp">
            <center>
            <button type="button" class="btn btn-outline-secondary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3M3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9z"/>
              </svg> New Search
            </button>
            </center></a>
        <br>
<%    for (Doctor doctor : doctors ) {
%>      <center>
        <div class="card text-center" style="width: 50%;">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="true" href="show-doctors.jsp">Doctor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="show-review.jsp?id=<%=doctor.getId()%>">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="make-review.jsp?name=<%=doctor.getName()%>&surname=<%=doctor.getSurname()%>&id=<%=doctor.getId()%>">New review</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
            <h5 class="card-title"><b><%=doctor.getName()%> <%=doctor.getSurname()%></b></h5>
            <p class="card-text"><b>Specialty:</b> <%=doctor.getSpecialty()%><br>
                                  <b>Location:</b> <%=doctor.getAddress()%><br>
                                     <b>Phone:</b> <%=doctor.getPhone()%><br>
                                    <%=doctor.getDetails()%><br>

<%  if (session.getAttribute("userPass") != null) {
%>      <a href="make-appointment.jsp?doctor=<%=doctor.getId()%>" class="btn btn-primary">Book Appointment</a>
<%  } 
    if (session.getAttribute("userPass") == null) {
        request.setAttribute("login_message", "You have to login first!");
%>  <a href="login.jsp?doctor=<%=doctor.getId()%>&login_message=${requestScope.login_message}" class="btn btn-primary" >Book Appointment</a>
<% 
      } %>       
            </div>
        </div>
        </center>
        <br>
        <br>
<%      
    }    
%>        
</body>
<%@ include file="footer.jsp"%>