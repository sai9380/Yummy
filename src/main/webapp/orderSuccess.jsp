<%@ page language="java"
         contentType="text/html; charset=UTF-8"
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

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f5f5f5;
}

.success-container{
    min-height:calc(100vh - 90px); /* 90px = navbar height */
    display:flex;
    justify-content:center;
    align-items:center;
    padding-top:30px;
}

.box{
    width:420px;
    background:#fff;
    padding:45px 40px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 15px 40px rgba(0,0,0,.12);
}

.box h1{
    font-size:52px;
    margin-bottom:10px;
}

.box h2{
    font-size:24px;
    margin:0;
    font-weight:700;
    color:#222;
}

.box p{
    color:#555;
    margin:15px 0 30px;
    font-size:18px;
}

.box a{
    display:inline-block;
    background:#ff2e63;
    color:#fff;
    text-decoration:none;
    padding:14px 40px;
    border-radius:10px;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}

.success-icon{
    font-size:70px;
    color:#22c55e;
    margin-bottom:20px;
}

.box a:hover{
    background:#e62657;
}
</style>

</head>

<body>
<jsp:include page="includes/navbar.jsp" />

<div class="success-container">

    <div class="box">

        <h1><i class="fa-solid fa-circle-check success-icon"></i></h1>

        <h2>Order Placed Successfully!</h2>

        <p>Thank you for ordering from Yummy.</p>

        <a href="HomeServlet">Continue Shopping</a>

    </div>

</div>

</body>
</html>