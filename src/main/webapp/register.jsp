<!DOCTYPE html>
<html>
<head>
<title>Yummy - Registration</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/auth.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>
  <link rel="icon" type="image/png" href="img/fav_tab2.png">

</head>
<body>

	<div class="auth-container">
		<h2>Create Account</h2>

		<form action="RegisterServlet" method="POST">

			<input type="text" name="username" placeholder="Username" required> 
			<input type="email" name="email" placeholder="Email" required> 
			<input type="password" name="password" placeholder="Password" required>
 			<input type="text" name="address" placeholder="Address" required> 
 			<input type="text" name="phoneNumber" placeholder="Phone Number" required> 
 			<input type="hidden" name="role" value="customer" required>
			<button type="submit">Register</button>

		</form>

		<p>
			Already have account? <a href="login.jsp">Login</a>
		</p>

	</div>

</body>
</html>