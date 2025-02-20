<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp"%>

<head>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
</head>
<body>
    <header>
        <div class="header-logo">
            <img src="images/YourMed24_logo.png" alt="Your Logo">
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/></svg> 
                     <%=patient.getSurname()%> <%=patient.getName()%></b>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="index.jsp">New Appointment</a></li>
                <li><a class="dropdown-item" href="my-appointments.jsp">My Appointments</a></li>
                <li><a class="dropdown-item" href="profile-details.jsp">My profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="logout.jsp">Log out</a></li>
            </ul>
          </div>
    </header>