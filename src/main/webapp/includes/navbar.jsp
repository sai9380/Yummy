<%@ page import="com.tap.model.User" %>

<%
User loggedUser = (User) session.getAttribute("loggedUser");

String username = "Guest";

if(loggedUser != null){
    username = loggedUser.getUsername();   // or getUserName() if that's your method
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>

<%
int cartCount = 0;

Cart cart = (Cart) session.getAttribute("cart");

if(cart != null){
    for(CartItem item : cart.getItems()){
        cartCount += item.getQuantity();
    }
}
%>
 <!-- NAVBAR -->
  <header class="navbar" id="navbar">
    <div class="logo">yummy.</div>

    <nav class="nav-links">
      <!-- MOBILE PROFILE (SIDEBAR ONLY) -->
      <div class="sidebar-profile">
        <div class="sidebar-user" id="sidebarProfileToggle">
          <i class="fa-solid fa-user"></i>
          <div>
            <strong><%= username %></strong>
            <small>View Profile</small>
          </div>
        </div>

        <div class="sidebar-profile-links">
          	<a href="ProfileServlet">My Profile</a>
			<a href="MyOrdersServlet">My Orders</a>
			<a href="LogoutServlet">Logout</a>
        </div>
      </div>

      <a href="HomeServlet">Home</a>
      <a href="HomeServlet#categories">Menu</a>
      <a href="HomeServlet#restaurants">Restaurants</a>
      <a href="HomeServlet#services">Services</a>
      <a href="HomeServlet#footer">About</a>

    </nav>



    <div class="nav-cart">
    <a href="CartServlet" class="cart-icon">
        <i class="fa-solid fa-cart-shopping"></i>
        <span class="cart-count"><%= cartCount %></span>
    </a>
	</div>

    <div class="nav-right">
      <!-- Profile -->
      <div class="profile">
        <i class="fa-solid fa-user profile-icon"></i>

        <div class="profile-dropdown">
          	<a href="ProfileServlet">My Profile</a>
			<a href="MyOrdersServlet">My Orders</a>
			<a href="LogoutServlet">Logout</a>
        </div>
      </div>
    </div>

    <div class="hamburger" id="hamburger">
      <span></span>
      <span></span>
      <span></span>
    </div>
 </header>