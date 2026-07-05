<%@ page import="com.tap.model.Restaurant"%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
Restaurant r = (Restaurant)request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy - Restaurant</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>

<jsp:include page="includes/navbar.jsp" />
<h1><%=r.getName()%></h1>

<h3>Address :</h3>
<p><%=r.getAddress()%></p>

<h3>Cuisine :</h3>
<p><%=r.getCuisineType()%></p>

<h3>Rating :</h3>
<p><%=r.getRating()%></p>

<h3>Delivery Time :</h3>
<p><%=r.getEta()%> Minutes</p>

<h3>Status :</h3>

<%
if(r.isAvailable()){
%>

<p style="color:green;">Open</p>

<%
}
else{
%>

<p style="color:red;">Closed</p>

<%
}
%>

</body>
</html>