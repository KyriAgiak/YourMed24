<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>


<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<%@ include file="authentication.jsp"%>
    
    <head>
		<%@ include file="header.jsp"%>
        <link href="css/style-login.css" rel="stylesheet">
		<title>Profile | YourMed24 </title>
    </head>
<%@ include file="logo-profile-button.jsp"%>    
<body>
    <div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Update profile</h2>
                        <% if(request.getAttribute("errorMessage") != null) { %>		
							<p><i class="zmdi zmdi-notifications-active animated infinite pulse zmdi-hc-fw mdc-text-blue"></i>
							<%=(String)request.getAttribute("errorMessage") %></p><br>
						<% } 
						%>
						
						<form method="POST" action="update-profile.jsp" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" value="<%=patient.getName()%>" />
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="surname" id="name" value="<%=patient.getSurname()%>" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" value="<%=patient.getEmail()%>" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder=" Fill in your new password" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Save" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/medical-person.jpg" alt="sing up image">
						</figure>
						<a href="delete-patient.jsp?delete=<%=patient.getId()%>" class="signup-image-link"><h6>Press here,<br>
							if you want to delete your account</h6>
						</a>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>

<%@ include file="footer.jsp"%>