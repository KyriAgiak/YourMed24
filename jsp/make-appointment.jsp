<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page errorPage="appError.jsp" %>


<%@ include file="authentication.jsp"%>
    
<%  
    String doctor_string=request.getParameter("doctor");
    int doctor_id = Integer.parseInt(doctor_string);
    Doctor doctor = Doctor.getDoctorById(doctor_id);

    // Get the current date
    Date currentDate = new Date();
    
    // Format the date in the required format (YYYY-MM-DD)
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>


<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> New Appointment | YourMed24</title>
    <style>
        input:invalid {
            border: 2px solid red;
        }
    </style>
</head>
<%@ include file="logo-profile-button.jsp"%>

<body>
    <a href="index.jsp"><center><b>Back to Search</b></center></a><br>
    <h3><center>New Appointment with doctor: <%=doctor.getName()%> <%=doctor.getSurname()%> (<%=doctor.getSpecialty()%>)</center></h3><br>
    <center>Note that appointments are made every an hour or half (e.g 10:00 or 10:30)</center>
        <center>
            <div class="container mt-5">
                <form action="confirm-appointment.jsp" method="post">
                    <div class="form-group">
                        <label for="datepicker">Select date:</label>
                        <input type="date" class="form-control" id="datepicker" name="selectedDate"  required style="width:50%" min="<%= formattedDate %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="timepicker">Select time:</label>
                        <input type="time" class="form-control" id="timepicker" name="selectedTime" step="1800" required style="width:50%">
                    </div>
                    <div class="form-group">
                        <input type="hidden" id="doctorId" name="doctorId" value="<%= doctor.getId() %>">
                    </div
                    <br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </center>
        <br>
        <br>
</body>
<%@ include file="footer.jsp"%>