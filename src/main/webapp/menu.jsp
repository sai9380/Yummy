<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy &ndash; Food Delivery</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>

<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin: 30px;
}

.menu-container {
	width: 90%;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 25px;
	padding-bottom: 40px;
}

.menu-card {
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
	transition: .3s;
}

.menu-card:hover {
	transform: translateY(-5px);
}

.menu-card img {
	width: 100%;
	height: 230px;
	object-fit: contain;
	padding: 10px 10px;
	border-radius: 16px 16px 0 0;
	transition: 0.3s ease;
}

.menu-details {
	padding: 15px;
	display: flex;
	flex-direction: column;
	height: 180px;
}

.menu-details form {
	margin-top: auto;
}

.menu-details h3 {
	margin: 0;
}

.menu-details p {
	color: #666;
}

.rating-price{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin:15px 0 20px;
}

.rating{
    display:inline-flex;
    align-items:center;
    gap:6px;
    background:#1faa59;
    color:#fff;
    padding:6px 12px;
    border-radius:8px;
    font-size:14px;
    font-weight:600;
    box-shadow:0 4px 10px rgba(31,170,89,.25);
}

.rating i{
    color:#fff;
    font-size:12px;
}

.price{
    color:#ff2e63;
    font-size:22px;
    font-weight:700;
}

button {
	width: 100%;
	padding: 12px;
	border: none;
	background: #ff2e63;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 8px;
}

button:hover {
	background: #e64a19;
}
</style>


</head>

<body>
	<jsp:include page="includes/navbar.jsp" />

	<h1>Restaurant Menu</h1>

	<div class="menu-container">

		<%
		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

		if (menuList != null) {

			for (Menu m : menuList) {
		%>

		<div class="menu-card">

			<img src="img/<%=m.getImageUrl()%>">

			<div class="menu-details">

				<h3><%=m.getDescription()%></h3>

				<div class="rating-price">

					<div class="rating">
						<i class="fa-solid fa-star"></i> <span><%=m.getRating()%></span>
					</div>

					<div class="price">
						₹<%=m.getPrice()%>
					</div>

				</div>

				<form action="AddToCartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">

					<button type="submit">Add To Cart</button>

				</form>

			</div>

		</div>

		<%
		}
		}
		%>

	</div>

</body>
</html>