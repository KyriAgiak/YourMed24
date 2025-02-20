<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ include file="authentication.jsp"%>
<% 
    String doctorStr=request.getParameter("doctor");
    int doctorId=Integer.parseInt(doctorStr);
    Doctor doctor = Doctor.getDoctorById(doctorId);
%>
<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> Doctor | YourMed24</title>
</head>
<%@ include file="logo-profile-button.jsp"%>
<body>
    <center>
    <br>
    <h3>About Doctor</h3>
    <br>
    <div class="card" style="width: 25rem;">
        <ul class="list-group list-group-flush">
          <li class="list-group-item"><b>Name:</b> <%=doctor.getName()%></li>
          <li class="list-group-item"><b>Surname:</b> <%=doctor.getSurname()%></li>
          <li class="list-group-item"><b>Specialty:</b> <%=doctor.getSpecialty()%></li>
          <li class="list-group-item"><b>Address:</b> <%=doctor.getAddress()%></li>
          <li class="list-group-item"><b>Phone:</b> <%=doctor.getPhone()%></li>
          <li class="list-group-item">     <%=doctor.getDetails()%></li>
        </ul>
      </div>
    <br>
    <a href="my-appointments.jsp" type="button" class="btn btn-primary">Back to Appointments</a>
    <br>
    <br>
    <br>
    <br>
</center>
</body>
<%@ include file="footer.jsp"%>
