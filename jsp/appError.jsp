<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp" %>
        <meta name="description" content="Medical services accessible to all">
        <meta name="keywords" content="doctor, patient, medical, appointment">
		<title> YourMed24 | Error Page</title>
    </head>
    
    <body>
      <div class="container">
        <div class="page-header">
            <br>
            <center>
			<h1>Oops something went wrong!</h1>
            </center> 
		</div>
        <div class="row">
            <div class="col-xs-12">
                <center>
                <h2>Description</h2>
                <br>
                <% if(exception != null) { %>	                  	
                    <p><code><%=exception %></code></p>						
                <% } %>		
                </center>
            </div>
        </div>        
      </div>
      <%@ include file="footer.jsp" %>	
  </body>
</html>