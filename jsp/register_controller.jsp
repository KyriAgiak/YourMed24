<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>YourMed24 | Register </title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!--Favicon-->
<link rel="icon" href="images/YourMed24_logo.png" type="image/x-icon">

<!-- Main css -->
<link rel="stylesheet" href="css/style-login.css">
</head>
<body>
	<header>
        <%@ include file="header.jsp"%>
		<div class="header-logo">
			<img src="images/YourMed24_logo.png" alt="Your Logo">
		</div>
        <a href="index.jsp">
			<button type="button" class="btn btn-danger">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
					<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
				  </svg>
			</button>
		</a>
	</header>

<%
    String name=request.getParameter("name");
    String surname=request.getParameter("surname");
    String email=request.getParameter("email");
    String password=request.getParameter("pass");
    String repass=request.getParameter("re_pass");
    int errorcounter = 0;

    if ( name == null && surname == null && email == null && password == null && repass == null ) {

        request.setAttribute("message", "No parameters specify.Please fill in the form");
    
%>  <jsp:forward page="registration.jsp"/>
<%   }
 
   if (name == null || name.length() < 3) {
       errorcounter++; } 
   if (surname == null || surname.length() < 3) {
       errorcounter++; }
    if (email == null || email.isEmpty()) {    
        errorcounter++; }
   if (password == null || password.length() < 5 ) {    
       errorcounter++; }
   if (repass.equals(password) == false) {      
       errorcounter++; }
       
    if (errorcounter == 0) {
        try {
            Patient new_patient = new Patient(name, surname, email, password);
            Patient.register(new_patient);
            Patient newPatient = Patient.login(new_patient.getEmail(), new_patient.getPassword());
            session.setAttribute("userPass", newPatient);
            response.sendRedirect("profile-home.jsp");
        } catch (Exception e) {

%> <section class="signup">
    <div class="container">
        <div class="signup-content">
            <div class="signup-form">
                <h2 class="form-title">Registration not completed</h2>
                <p><i class="zmdi zmdi-notifications-active animated infinite pulse zmdi-hc-fw mdc-text-blue"></i><%=e.getMessage()%></p>
                <div class="form-group form-button">
                    <a href="registration.jsp" name="signup" id="signup"
                        class="form-submit">Back to the form</a>
                </div>
            </div>
        </div>
    </div>
    </section>
<%      } 
    }
    if (errorcounter > 0) { 
%>      <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Registration form has errors</h2>
                            <p><i class="zmdi zmdi-notifications-active animated infinite pulse zmdi-hc-fw mdc-text-blue"></i></p>
                        <ul>
                        
<%                      
                        if (name == null || name.length() < 3) {
%>                          <li>Name must be at least 3 characters long</li>
<%                      }
                        if (surname == null || surname.length() < 3) {
%>                          <li>Surname must be at least 3 characters long</li>
<%                      }
                        if (email == null || email.isEmpty()) {
%>                        <li>You have not filled your email</li>
<%                      }

                        if (password == null || password.length() < 5 ) {
%>                         <li>Password must be at least 5 characters long</li>
<%                      }
                        if (repass.equals(password) == false) {
%>                       <li>Password and confirm does not match</li>
<%                      }
%>                      </ul>
                        <div class="form-group form-button">
                        <a href="registration.jsp" name="signup" id="signup"
                        class="form-submit">Back to form</a>
                        </div>
                    </div>
                    <div class="signup-image">
						<figure>
							<img src="images/medical-person.jpg" alt="sing up image">
						</figure>
                    </div>
                </div>        
            </div>            
        </section>
<% 
    }                
%>                   
                        
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<footer>
        <p style="color: white;">&copy; 2023 YourMed24</p>
    </footer>


</body>

</html>