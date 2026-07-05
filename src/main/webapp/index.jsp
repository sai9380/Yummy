<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy &ndash; Food Delivery</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="icon" type="image/png" href="img/fav_tab2.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>
<script
	src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

</head>

<body>
	<%
	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
	%>
	<!-- LOTTIE PRELOADER -->
	<div id="preloader">
		<div class="lottie-box">
			<lottie-player
				src="https://assets10.lottiefiles.com/packages/lf20_j1adxtyb.json"
				background="transparent" speed="1"
				style="width: 180px; height: 180px;" loop autoplay>
			</lottie-player>

			<h2>yummy.</h2>
		</div>
	</div>


	<div id="top"></div>

	<!-- NAVBAR -->
	<jsp:include page="includes/navbar.jsp" />
	</header>

	<!-- HERO -->
	<section class="hero">
		<div class="hero-text">
			<h1>
				Discover <span>restaurants</span>
			</h1>
			<h1>that</h1>
			<h1>
				<span>deliver near </span> you
			</h1>

			<form action="SearchServlet" method="get" class="search-bar">

				<input type="text" name="keyword"
					placeholder="Search Pizza, Burger, Drinks..." required>

				<button type="submit">Search</button>

			</form>
		</div>

		<div class="hero-img">
			<!-- <img src="img/hero image2.png" alt="Food"> -->
		</div>
	</section>

	<!-- CATEGORIES -->
	<section class="categories" id="categories">
		<h1>Menu</h1>
		<h2>Popular Categories</h2>

		<div class="category-grid">
			<div class="category-card">
				<a href="#pizza"><img src="img/pizza cat.png" alt="Food"></a>
				Pizza
			</div>

			<div class="category-card">
				<a href="#burger"><img src="img/burger cat.png" alt="Food"></a>
				Burgers
			</div>

			<div class="category-card">
				<a href="#healthy"><img src="img/Healthy cat.png" alt="Food"></a>
				Healthy
			</div>

			<div class="category-card">
				<a href="#dessert"><img src="img/Desserts cat.png" alt="Food"></a>
				Desserts
			</div>

			<div class="category-card">
				<a href="#Beverages"><img src="img/Beverages cat.png" alt="Food"></a>
				Beverages
			</div>
		</div>
	</section>

	<!-- RESTAURANTS -->
	<section class="restaurants" id="restaurants">

		<h2>Popular Restaurants</h2>

		<div class="restaurant-grid">

			<%
			List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");

			if (restaurantList != null) {

				for (Restaurant r : restaurantList) {
			%>

			<a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>"
				style="text-decoration: none; color: inherit;">

				<div class="restaurant-card">

					<img src="img/<%=r.getImageUrl()%>" alt="<%=r.getName()%>">

					<h3><%=r.getName()%></h3>

					<p>
						⭐
						<%=r.getRating()%>
						• ⏱
						<%=r.getEta()%>
						mins
					</p>

				</div>

			</a>

			<%
			}
			}
			%>

		</div>

	</section>

	<!--============ Pizza============== -->

	<section class="featured" id="pizza">
		<h2>Pizza</h2>

		<div class="dish-grid">

			<%
			if (menuList != null) {
				for (Menu menu : menuList) {

					if (menu.getType().equalsIgnoreCase("Pizza")) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>

			</div>

			<%
			}
			}
			}
			%>

		</div>

	</section>

	<!--============= Burger ============-->

	<section class="featured" id="burger">
		<h2>Burgers</h2>

		<div class="dish-grid">
			<%
			if (menuList != null) {
				for (Menu menu : menuList) {

					if (menu.getType().equalsIgnoreCase("Burger")) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>
			</div>

			<%
			}
			}
			}
			%>

		</div>
	</section>

	<!-- =========Healthy=========== -->
	<section class="featured" id="healthy">
		<h2>Healthy</h2>
		<div class="dish-grid">
			<%
			if (menuList != null) {
				for (Menu menu : menuList) {

					if (menu.getType().equalsIgnoreCase("Healthy")) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>

			</div>

			<%
			}
			}
			}
			%>

		</div>
	</section>

	<!-- ====================dessert=============== -->
	<section class="featured" id="dessert">
		<h2>Desserts</h2>
		<div class="dish-grid">
			<%
			if (menuList != null) {
				for (Menu menu : menuList) {

					if (menu.getType().equalsIgnoreCase("Dessert")) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>
			</div>

			<%
			}
			}
			}
			%>

		</div>
	</section>

	<!--============= Beverages ============-->

	<section class="featured" id="Beverages">
		<h2>Beverages</h2>
		<div class="dish-grid">
			<%
			if (menuList != null) {
				for (Menu menu : menuList) {

					if (menu.getType().equalsIgnoreCase("Beverage")) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>

			</div>

			<%
			}
			}
			}
			%>

		</div>
	</section>

	<!-- FEATURED DISHES -->
	<section class="featured">

		<h2>Featured Dishes</h2>

		<div class="dish-grid">

			<%
			List<Menu> featuredList = (List<Menu>) request.getAttribute("featuredList");

			if (featuredList != null) {
				for (Menu menu : featuredList) {
			%>

			<div class="dish-card">

				<img src="img/<%=menu.getImageUrl()%>"
					alt="<%=menu.getDescription()%>">

				<h4><%=menu.getDescription()%></h4>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=menu.getRating()%></span>
					</div>

					<div class="price">
						₹<%=menu.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

					<input type="hidden" name="source" value="home">

					<button type="submit">Add To Cart</button>

				</form>

			</div>

			<%
			}
			}
			%>

		</div>

	</section>

	<!-- offer -->
	<section class="offer" id="offer">
		<span class="offer-badge">30% OFF</span>

		<h2>Flat 30% OFF on your first order</h2>
		<p>
			Use code <strong>YUMMY30</strong>
		</p>

		<div class="countdown">
			<div>
				<span id="hours">02</span> <small>Hrs</small>
			</div>
			<div>
				<span id="minutes">15</span> <small>Min</small>
			</div>
			<div>
				<span id="seconds">10</span> <small>Sec</small>
			</div>
		</div>

		<a href="#categories"><button>Order Now</button></a>
	</section>

	<!-- services -->
	<section class="service-contact" id="services">
		<div class="sc-container">

			<!-- LEFT : IMAGE -->
			<div class="sc-image">
				<img src="img/delivery boy.png" alt="Food Delivery">
			</div>

			<!-- RIGHT : CONTENT -->
			<div class="sc-content">
				<h1>
					<span class="badge">Why Choose Us</span>
				</h1>
				<h2>
					Fast <span class="color">Food Delivery</span> & Easy Contact
				</h2>
				<p class="sc-desc">Order your favorite food and get it delivered
					fresh, fast, and safely. Need help? Contact us anytime.</p>

				<!-- SERVICES -->
				<div class="sc-services">
					<div class="sc-item">
						<i class="fa-solid fa-truck-fast"></i> <span>Fast Delivery</span>
					</div>

					<div class="sc-item">
						<i class="fa-solid fa-burger"></i> <span>Premium Quality</span>
					</div>

					<div class="sc-item">
						<i class="fa-solid fa-headset"></i> <span>24/7 Support</span>
					</div>
				</div>

				<!-- CONTACT INFO -->
				<div class="sc-contact-info">
					<div>
						<i class="fa-solid fa-phone"></i> <span>+91 00000 00000</span>
					</div>
					<div>
						<i class="fa-solid fa-location-dot"></i> <span>Belgaum,
							Karnataka</span>
					</div>
					<div>
						<i class="fa-regular fa-clock"></i> <span>10:00 AM &ndash;
							10:00 PM</span>
					</div>
				</div>

				<a href="#categories" class="sc-btn">Order Now</a>
			</div>

		</div>
	</section>


	<!-- FOOTER -->
	<footer class="footer" id="footer">
		<div class="footer-container">

			<!-- Brand Info -->
			<div class="footer-brand">
				<h2>yummy.</h2>
				<p>Your favorite food delivery app bringing delicious meals
					right to your doorstep.</p>

				<!-- Social Icons (ADDED) -->
				<div class="footer-social">
					<a href="#footer"><i class="fab fa-facebook-f"></i></a> <a
						href="#footer"><i class="fab fa-x-twitter"></i></a> <a
						href="#footer"><i class="fab fa-linkedin-in"></i></a> <a
						href="#footer"><i class="fab fa-instagram"></i></a>
				</div>
			</div>

			<!-- Quick Links -->
			<div class="footer-links">
				<h3>Quick Links</h3>
				<a href="#restaurants">Restaurants</a> <a href="#categories">Menu</a>
				<a href="#offer">Offers</a> <a href="#services">Contact</a>
			</div>

			<!-- Support -->
			<div class="footer-links">
				<h3>Support</h3>
				<a href="#">Help Center</a> <a href="#">Track Order</a> <a href="#">Refund
					Policy</a> <a href="#">Terms & Conditions</a>
			</div>

			<!-- Contact Info -->
			<div class="footer-contact">
				<h3>Contact Info</h3>
				<p>
					<i class="fa-solid fa-phone"></i> +91 0000 0000
				</p>
				<p>
					<i class="fa-solid fa-phone"></i> +88 0000 0000
				</p>
				<p>
					<i class="fa-solid fa-envelope"></i> support@yummy.com
				</p>
				<p>
					<i class="fa-solid fa-location-dot"></i> Belgaum, Karnataka
				</p>
			</div>
		</div>

		<hr>

		<p class="footer-bottom">&copy;2025 yummy. All rights reserved.</p>
		<a href="#top" id="scrollTopBtn"> <i class="fa-solid fa-arrow-up"></i>
		</a>
	</footer>
</body>
</html>