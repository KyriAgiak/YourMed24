<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page errorPage="appError.jsp" %>


<title> Appointment Confirmation | YourMed24</title>

<%@ include file="authentication.jsp"%> 

<%    
    String date_string = request.getParameter("selectedDate");
    String time_string = request.getParameter("selectedTime");
    String doctorIdStr = request.getParameter("doctorId");
    int doctorId = Integer.parseInt(doctorIdStr);
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date parsedDate = dateFormat.parse(date_string);
    Date date = new Date(parsedDate.getTime());
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
    java.util.Date parsedTime = timeFormat.parse(time_string);
    Time time = new Time(parsedTime.getTime());
    
    try {
    Appointment.makeAppointment(new Appointment(date, time, patient.getId(), doctorId));
    } catch (Exception e) {
    String errorMessage = e.getMessage();
    request.setAttribute("errorMessage", errorMessage);
    }
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
</head>
<%@ include file="logo-profile-button.jsp"%>

<body>
    <br>
    <h3><center>Appointment Status</center></h3><br>
        <br>
        <center>
            <div class="row" style="width: 60%;">
                <div class="col-xs-12">
                <%       
                    if (errorMessage != null) {
                %>
                        <div class="alert alert-danger">
                        <%= errorMessage %>
                        </div>
                <%
                } else {
                %>
                    <div class="alert alert-success">
                        Your appointment has been successfully booked!<br>
                        <a href="my-appointments.jsp">Press here to see your appointments</a>   
                    </div>
                <% } %>
                </div>
            </div>
        </center>
</body>
<%@ include file="footer.jsp"%>