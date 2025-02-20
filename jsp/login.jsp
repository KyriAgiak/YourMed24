<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp"%>


<% 
	Patient patient = (Patient)session.getAttribute("userPass");
	if (session.getAttribute("userPass") != null) {
    	response.sendRedirect("profile-home.jsp");
	}
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login | YourMed24</title>

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

	<div class="main">
		
<%		 if(request.getAttribute("delete-message") != null) {
%>		<div class="container theme-showcase" role="main" style="width: 50%;">
			<div class="alert alert-success text-center" role="alert">
				<%=(String)request.getAttribute("delete-message") %></div>
		</div>
<% 		}
%>
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/medical-person.jpg" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Don't have account?
							You can create one here</a>
					</div>
					<div class="signin-form">
						<% if(request.getParameter("login_message") != null) { %>		
							<div class="container theme-showcase" role="main" style="width: 60%;">
								<div class="alert alert-danger text-center" role="alert">
									<%=(String)request.getParameter("login_message") %></div>
							</div>
						<% } 
							 if(request.getAttribute("login_review") != null) { %>		
							<div class="container theme-showcase" role="main" style="width: 60%;">
								<div class="alert alert-danger text-center" role="alert">
									<%=(String)request.getAttribute("login_review") %></div>
							</div>
						<% } 
						%>
						<h2 class="form-title">Log In</h2>
						<%	if(request.getAttribute("error_message") != null) { %>		
							<p><i class="zmdi zmdi-notifications-active animated infinite pulse zmdi-hc-fw mdc-text-blue"></i>
							<%=(String)request.getAttribute("error_message") %></p><br>
						<% } 
							if(request.getAttribute("successMessage") != null) { %>		
							<p><i class="zmdi zmdi-notifications-active animated infinite pulse zmdi-hc-fw mdc-text-blue"></i>
							<%=(String)request.getAttribute("successMessage") %></p><br>
						<% }
						%>
						<form method="POST" action="login_controller.jsp" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-email"></i></label> <input
									type="text" name="email" id="email"
									placeholder="Your email" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<footer>
        <p style="color: white;">&copy; 2023 YourMed24</p>
    </footer>
</body>
</html>