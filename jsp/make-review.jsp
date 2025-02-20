<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yourmed24.*"%>
<%@ page errorPage="appError.jsp"%>

<head>
    <%@ include file="header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/styleHome.css">
    <title> New Review | YourMed24</title>
</head>
<%  
    String idStr=request.getParameter("id");
    String dname=request.getParameter("name");
    String dsurname=request.getParameter("surname");
    if (idStr == null && dname == null && dsurname == null ) {
        request.setAttribute("message-no-param", "No parameters specified.You have to choose a doctor!");
%>     <jsp:forward page="index.jsp"/>
<%  }
    int doctor_id=Integer.parseInt(idStr);
    Patient patient =(Patient)session.getAttribute("userPass");
    if (session.getAttribute("userPass") == null) {
        request.setAttribute("login_review","You have to login first!");
%>     <jsp:forward page="login.jsp?doctor=<%=doctor.getId()%>"/>
<%  }
    if (session.getAttribute("userPass") != null) {
%>    <%@ include file="logo-profile-button.jsp"%>
<% }
%>
<body>
    <center>
        <h4>Write a Review for Dr.<%=dname %> <%=dsurname %></h4>
    <form action="add-review.jsp" method="get">
        <br>
        <label for="rating"><b>Rate:</b></label>
        <input type="number" name="rating" id="rating" min="1" max="5" required>
        <label for="review"><b>Write a review:</b></label>
        <textarea name="review" id="review" rows="4" cols="50"></textarea>
        <input type="hidden" name="doctor_id" value="<%=doctor_id%>">
        <br>
        <br>
        <button type="submit">Submit</button>
    </form>
    </center>
</body>
<%@ include file="footer.jsp"%>