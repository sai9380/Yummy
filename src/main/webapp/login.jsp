<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>
    <title>Yummy - Login</title>
    <link rel="stylesheet" href="auth.css">
      <link rel="icon" type="image/png" href="img/fav_tab2.png">
    
</head>
<body>

<div class="auth-container">

    <h2>Login</h2>

    <form action="LoginServlet" method="POST">

        <input type="email"
               name="email"
               placeholder="Email"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <button type="submit">
            Login
        </button>

    </form>

    <p>
        Don't have account?
        <a href="register.jsp">Register</a>
    </p>

</div>

</body>
</html>