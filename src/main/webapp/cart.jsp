<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.util.Collection"%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy - Cart</title>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>



<style>

body{
    font-family:Arial, sans-serif;
    background:#f5f5f5;
    margin:0;
}

.container{
    width:80%;
    margin:30px auto;
}


h1{
    text-align:center;
}

.card{
    background:white;
    padding:20px;
    margin:20px 0;
    border-radius:10px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 10px rgba(0,0,0,.15);
}

img{
    width:120px;
    height:100px;
    object-fit:cover;
    border-radius:10px;
}

button{
    background:#ff2e63;
    color:white;
    border:none;
    padding:10px 20px;
    border-radius:6px;
    cursor:pointer;
}

.total{
    text-align:right;
    font-size:24px;
    font-weight:bold;
    margin-top:20px;
}

.checkout{
    text-align:right;
    margin-top:20px;
}

 button:hover {
  background: #e62657;
}
/* ================= MOBILE RESPONSIVE ================= */

@media screen and (max-width:768px){

    .container{
        width:95%;
        margin:20px auto;
    }

    h1{
        font-size:28px;
        margin-bottom:20px;
    	text-align:center;
	}
	
	h2{
		text-align:center;
	}

    .card{
        flex-direction:column;
        text-align:center;
        padding:20px;
        gap:15px;
    }

    .card img{
        width:180px;
        height:180px;
        object-fit:contain;
    }

    .card h2{
        font-size:26px;
        margin:10px 0;
        line-height:1.2;
    }

    .card p{
        font-size:20px;
        margin:10px 0;
    }

    /* Quantity Buttons */
    .card div[style]{
        justify-content:center !important;
        gap:18px !important;
        margin:15px 0;
    }

    .card div[style] button{
        width:45px;
        height:45px;
        padding:0;
        font-size:22px;
        border-radius:10px;
    }

    .card strong{
        font-size:22px;
        min-width:30px;
        display:inline-block;
    }

    form button{
        font-size:18px;
    }

    .total{
        text-align:center;
        font-size:26px;
        margin-top:30px;
    }

    .checkout{
        text-align:center;
        margin-top:25px;
    }

    .checkout button{
        width:100%;
        max-width:320px;
        padding:15px;
        font-size:18px;
        border-radius:10px;
    }

}

</style>

</head>

<body>
<jsp:include page="includes/navbar.jsp" />

<div class="container">

<h1>🛒 Shopping Cart</h1>

<%

Cart cart=(Cart)session.getAttribute("cart");

if(cart!=null){

Collection<CartItem> items=cart.getItems();

for(CartItem item:items){

%>

<div class="card">

<div>

<img src="img/<%=item.getMenu().getImageUrl()%>">

</div>

<div>

<h2><%=item.getMenu().getDescription()%></h2>

<p>Price : ₹<%=item.getMenu().getPrice()%></p>

<div style="display:flex;align-items:center;gap:10px;">

    <!-- Decrease -->
    <form action="UpdateCartServlet" method="post">
        <input type="hidden" name="menuId"
               value="<%=item.getMenu().getMenuId()%>">

        <input type="hidden" name="action" value="decrease">

        <button type="submit">−</button>
    </form>

    <strong><%=item.getQuantity()%></strong>

    <!-- Increase -->
    <form action="UpdateCartServlet" method="post">
        <input type="hidden" name="menuId"
               value="<%=item.getMenu().getMenuId()%>">

        <input type="hidden" name="action" value="increase">

        <button type="submit">+</button>
    </form>

</div>
<br>

<p>Total : ₹<%=item.getTotalPrice()%></p>

<form action="RemoveCartServlet" method="post">

    <input type="hidden"
           name="menuId"
           value="<%=item.getMenu().getMenuId()%>">

    <button type="submit"
        style="background:#ff2e63;margin-top:10px;">
        Remove
    </button>

</form>

</div>

</div>

<%

}

%>

<div class="total">

Grand Total : ₹<%=cart.getTotalPrice()%>

</div>

<div class="checkout">

<a href="checkout.jsp">

<button>Proceed To Checkout</button>

</a>

</div>

<%

}else{

%>

<h2>Your Cart is Empty</h2>

<%

}

%>



</div>

</body>
</html>