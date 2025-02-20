<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>

<%	
Patient patient = (Patient)session.getAttribute("userPass");

if (session.getAttribute("userPass") == null) {

	request.setAttribute("message", "You are not authorized to access this resource. Please login.");

%> 
<jsp:forward page="login.jsp"/>
<%
}
    String name=request.getParameter("name");
    String surname=request.getParameter("surname");
    String email=request.getParameter("email");
    String password=request.getParameter("pass");
	int errorcounter = 0;
	
	if ( name == null && surname == null && email == null && password == null ) {

		throw new Exception("No parameters specified, please visit <a href='profile-details.jsp'>update form</a>");
	
	}

	if (name == null || name.length() < 3) {
		errorcounter++; } 
	if (surname == null || surname.length() < 3) {
		errorcounter++; }
	 if (email == null || email.isEmpty()) {    
		 errorcounter++; }
	if (password == null || password.length() < 5 ) {    
		errorcounter++; }
	
		if (errorcounter > 0) {
			request.setAttribute("errorMessage", "Form has " + (errorcounter == 1 ? "1 error!" : errorcounter + " errors!"));
		%>
			<jsp:forward page="profile-details.jsp"/>
		<%
			return;
		}

		Patient new_patient = new Patient(patient.getId(),name, surname, email, password);
		try {
        Patient.updatePatient(new_patient);
		request.setAttribute("successMessage", "Your details have been updated successfully!Please log in again");
		session.invalidate();
		} catch (Exception e) {

		}
%>
		<jsp:forward page="login.jsp"/>



    