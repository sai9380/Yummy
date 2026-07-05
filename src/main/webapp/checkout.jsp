<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy - Checkout</title>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{
    width:500px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,.2);
}

input,select{
    width:100%;
    padding:12px;
    margin:10px 0;
}

button{
    width:100%;
    padding:15px;
    background:#ff2e63;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

@media (max-width:900px){

    .container{
        width:95%;
        margin:80px auto 25px;
}

</style>

</head>

<body>
<jsp:include page="includes/navbar.jsp" />


<div class="container">

<h2>Checkout</h2>

<form action="PlaceOrderServlet" method="post">

<label>Delivery Address</label>

<input
type="text"
name="address"
required>

<label>Payment Method</label>

<select name="paymentMethod">

<option>Cash On Delivery</option>

<option>UPI</option>

<option>Credit Card</option>

<option>Debit Card</option>

</select>

<button type="submit">

Place Order

</button>

</form>

</div>

</body>
</html>