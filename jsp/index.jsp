<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>


<% 
    Patient patient = (Patient)session.getAttribute("userPass");

%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <meta name="description" content="Medical services accessible to all">
    <meta name="keywords" content="doctor, patient, medical, appointment">
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title>YourMed24 | Home</title>
</head>
<body>
<% 
    if (session.getAttribute("userPass") == null) {
%>   <header>
        <div class="header-logo">
            <img src="images/YourMed24_logo.png" alt="Your Logo">
        </div>
        <div class="header-login">
            <a href="login.jsp">Login</a>
            <a href="registration.jsp">Register</a>
        </div>
    </header>
<% }
    if  (session.getAttribute("userPass") != null) {
%>  <%@ include file="logo-profile-button.jsp"%>
<% }
    if (request.getAttribute("message-no-param") != null) {
    %>  <div class="container theme-showcase" role="main" style="width: 60%;">
        <div class="alert alert-danger text-center" role="alert">
            <%=(String)request.getAttribute("message-no-param") %></div>
    </div>
    <% }
    %>
    <section class="main-content">
        <h1>Welcome to YourMed24<br>Book your appointment below</h1>
        <div class="search-form">
            <form action="show-doctors.jsp" method="get">
                <div class="form-group">
                    <label for="category"><b>Select Specialty:</b></label>
                    <select id="category" name="category">
                        <option value="Cardiologist">Cardiologist</option>
                        <option value="Gynecologist">Gynecologist</option>
                        <option value="General Practicioner">General Practicioner</option>
                        <option value="Dentist">Dentist</option>
                        <option value="Pediatrician">Pediatrician</option>
                        <option value="Dermatologist">Dermatologist</option>
                        <option value="Psychologist">Psychologist</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="location"><b>Select Location:</b></label>
                    <select id="location" name="location">
                        <option value="Cholargos">Cholargos</option>
                        <option value="Marousi">Marousi</option>
                        <option value="Ampelokipoi">Ampelokipoi</option>
                        <option value="Piraeus">Piraeus</option>
                        <option value="Kifisia">Kifisia</option>
                        <option value="Kolonaki">Kolonaki</option>
                        <option value="Koukaki">Koukaki</option>
                    </select>
                </div>
                <br>
                <button type="submit" value="send" class="btn btn-primary">Search</button>
              
            </form>
        </div>
    </section>
    
    <footer>
        <p>&copy; 2023 YourMed24</p>
    </footer>
</body>
</html>
