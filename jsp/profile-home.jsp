<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp" %>


<title>Profile Home | YourMed24</title>

<%@ include file="authentication.jsp"%>
<%@ include file="header.jsp"%>
    <head>
    <link href="css/style-login.css" rel="stylesheet">
    </head>
<%@ include file="logo-profile-button.jsp"%>
    

<body>
	<div class="main">
        <div class="container">
          <center>
            <%  if (request.getAttribute("successReview") != null) {
              %>    <div class="row" style="width: 60%;">
                      <div class="col-xs-12">
                          <div class="alert alert-success">
                            <h6><%=(String)request.getAttribute("successReview") %></h6>
                          </div>    
                      </div>
                  </div>
              <%  }
              %>
            <h2>Welcome <%=patient.getName()%></h2>
            <h4>book your appointment <a href="index.jsp">here </a>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-heart" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M5 1.5A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm5 0a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5z"/>
                <path d="M3 1.5h1v1H3a1 1 0 0 0-1 1V14a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V3.5a1 1 0 0 0-1-1h-1v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
                <path d="M8 6.982C9.664 5.309 13.825 8.236 8 12 2.175 8.236 6.336 5.31 8 6.982"/>
              </svg>
            </h4>
          </center>

        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>
