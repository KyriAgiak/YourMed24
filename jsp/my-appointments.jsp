<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="yourmed24.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page errorPage="appError.jsp" %>

<%@ include file="authentication.jsp"%>
<% 
    List<Appointment> appointments = new ArrayList<Appointment>();
    appointments = Appointment.showAppointments(patient.getId());
%>

<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> My Appointments | YourMed24</title>
</head>
<%@ include file="logo-profile-button.jsp"%>
<body>
<center>
    <br>
    <h3>Scheduled Appointments</h3>
    <br>
    <%
	if (request.getAttribute("successMessage") != null) {	
%>				
		<div class="row" style="width: 60%;">
			<div class="col-xs-12">
				<div class="alert alert-success">
					<%=(String)request.getAttribute("successMessage") %>
				</div>
			</div>
		</div>
<%
	}			
%>
  <table class="table" style="width: 60%;">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Doctor</th>
            <th scope="col">Cancel</th>
          </tr>
        </thead>
        <tbody>       
<% 
    int counter=0;
    for (Appointment appointment : appointments) {
        counter++;    
%>      <tr>
            <th scope="row"><%=counter%></th>
            <td><%=appointment.getDate()%></td>
            <td><%=appointment.getTime()%></td>
            <td><a href="doctor-details.jsp?doctor=<%=appointment.getDoctor().getId()%>"><%=appointment.getDoctor().getSpecialty()%></a></td>
            <td><a href="cancel-appointment.jsp?app=<%=appointment.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square-fill" viewBox="0 0 16 16">
                <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708"/>
              </svg></a></td>
        </tr>
<%    }
%>
        </tbody>
      </table>         
    <br>
<%   if (appointments.size() == 0) {
%>
        <tr>
            <td colspan="7" class="text-center"><b>There are no appointments</b></td>
        </tr>
<%
    }
%>
</center>
</body>
<%@ include file="footer.jsp"%>