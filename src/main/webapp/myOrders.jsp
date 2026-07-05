<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy &ndash; Food Delivery</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="icon" type="image/png" href="img/fav_tab2.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script><style>

body{
    margin:0;
    background:#f5f5f5;
    font-family:Arial,sans-serif;
}

.orders-container{
    width:min(95%,850px);
    margin:100px auto 40px;
}

h1{
    text-align:center;
    color:#ff2e63;
    margin-bottom:30px;
}

.order-card{
    width:100%;
    background:#fff;
    border-radius:14px;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
    padding:22px;
    margin-bottom:22px;
}

.order-card p{
    margin:8px 0;
    font-size:15px;
}

.status{
    color:#18a558;
    font-weight:700;
}

.back-btn{
    display:block;
    width:240px;
    margin:35px auto 0;
    text-align:center;
    background:#ff2e63;
    color:#fff;
    text-decoration:none;
    padding:14px;
    border-radius:10px;
    font-weight:600;
}

.back-btn:hover{
    background:#e62657;
}

/* Mobile */
@media(max-width:768px){

    .orders-container{
        width:95%;
        margin:80px auto 25px;
    }

    h1{
        font-size:30px;
        margin-bottom:30px;
    }

    .order-card{
        padding:18px;
        border-radius:12px;
    }

    .order-card p{
        font-size:14px;
    }

    .back-btn{
        width:100%;
    }
}

</style>

</head>
<body>
<jsp:include page="includes/navbar.jsp" />

<div class="orders-container">

    <h1>My Orders</h1>

    <%
    List<Order> orders = (List<Order>)request.getAttribute("orders");

    if(orders != null && !orders.isEmpty()){

        for(Order order : orders){
    %>

    <div class="order-card">

        <p><b>Order ID:</b> <%=order.getOrderId()%></p>

        <p><b>Restaurant ID:</b> <%=order.getRestaurantId()%></p>

        <p><b>Total Amount:</b> ₹ <%=order.getTotalAmount()%></p>

        <p><b>Order Date:</b> <%=order.getOrderDate()%></p>

        <p><b>Address:</b> <%=order.getAddress()%></p>

        <p><b>Payment:</b> <%=order.getPaymentMethod()%></p>

        <p>
            <b>Status:</b>
            <span class="status"><%=order.getStatus()%></span>
        </p>

    </div>

    <%
        }
    } else {
    %>

    <h2 style="text-align:center;color:gray;">No Orders Found</h2>

    <%
    }
    %>

    <a href="HomeServlet" class="back-btn">
        Continue Shopping
    </a>

</div>

</body>
</html>