<%@page import="java.util.List"%>
<%@page import="com.tap.model.Menu"%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
List<Menu> list=(List<Menu>)request.getAttribute("searchResult");
String keyword=(String)request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>
<head>

<title>Search Result</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<jsp:include page="includes/navbar.jsp"/>

<section class="featured">

<h2>
Search Result for "<%=keyword%>"
</h2>

<div class="dish-grid">

<%
if(list!=null && !list.isEmpty()){

for(Menu menu:list){
%>

<div class="dish-card">

<img src="img/<%=menu.getImageUrl()%>">

<h4><%=menu.getDescription()%></h4>

<div class="rating-price">

<div class="rating">

<i class="fa-solid fa-star"></i>

<%=menu.getRating()%>

</div>

<div class="price">

₹<%=menu.getPrice()%>

</div>

</div>

<form action="AddToCartServlet" method="post">

<input type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<button>Add To Cart</button>

</form>

</div>

<%
}

}else{
%>

<h2>No Food Found</h2>

<%
}
%>

</div>

</section>

</body>
</html>