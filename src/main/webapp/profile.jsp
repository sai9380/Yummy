<%@ page import="com.tap.model.User"%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yummy - Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<script src="${pageContext.request.contextPath}/script.js" defer></script>

<style>

body{
    margin:0;
    background:#f5f5f5;
    font-family:Arial, sans-serif;
}

.container{
    width:min(90%,500px);
    margin:100px auto 40px;
    background:#fff;
    border-radius:15px;
    padding:30px;
    box-shadow:0 12px 35px rgba(0,0,0,.12);
    box-sizing:border-box;
}

h2{
    text-align:center;
    color:#ff2e63;
    margin-bottom:25px;
}

label{
    display:block;
    font-weight:600;
    margin-bottom:6px;
    color:#333;
}

input{
    width:100%;
    padding:12px;
    margin-bottom:18px;
    border:1px solid #ddd;
    border-radius:8px;
    font-size:15px;
    box-sizing:border-box;
    outline:none;
}

input:focus{
    border-color:#ff2e63;
}

button{
    width:100%;
    padding:14px;
    border:none;
    background:#ff2e63;
    color:#fff;
    font-size:16px;
    font-weight:600;
    border-radius:8px;
    cursor:pointer;
    transition:.3s;
}

button:hover{
    background:#e62657;
}

.profile-header{
    text-align:center;
    margin-bottom:30px;
}

.profile-avatar{
    width:90px;
    height:90px;
    margin:0 auto 15px;
    background:#ff2e63;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    box-shadow:0 10px 25px rgba(255,46,99,.3);
}

.profile-avatar i{
    color:#fff;
    font-size:38px;
}

.profile-header h2{
    margin:10px 0 5px;
    color:#222;
    font-size:28px;
}

.profile-header p{
    color:#777;
    font-size:15px;
}

label{
    font-size:14px;
    font-weight:600;
    color:#555;
}

input{
    transition:.3s;
}

input:hover{
    border-color:#ff2e63;
}

button{
    margin-top:10px;
    letter-spacing:.5px;
}

button i{
    margin-right:8px;
}

/* Tablet */
@media (max-width:768px){

    .container{
        width:92%;
        margin:90px auto 25px;
        padding:22px;
        border-radius:12px;
    }

    .profile-header h2{
        font-size:24px;
    }

    .profile-header p{
        font-size:14px;
    }

    .profile-avatar{
        width:80px;
        height:80px;
    }

    .profile-avatar i{
        font-size:34px;
    }

    label{
        font-size:14px;
    }

    input{
        padding:12px;
        font-size:15px;
    }

    button{
        padding:13px;
        font-size:15px;
    }
}

/* Mobile */
@media (max-width:480px){

	.container{
        width:95%;
        margin:75px auto 20px;
        padding:22px;
        border-radius:16px;
    }

    .profile-avatar{
    	width:82px;
    	height:82px;
    }

    .profile-avatar i{
        font-size:34px;
    }

    .profile-header h2{
        font-size:20px;
    }
    
    label{
         font-size:14px;
   		 font-weight:Bold;
    	 margin-bottom:8px;
    }

    input{
    	height:48px;
    	padding:0 14px;
    	font-size:15px;
    }

    button{
        width:100%;
    	height:48px;
    	border-radius:10px;
    	font-size:15px;
    	font-weight:600;
    }
    h2{
        font-size:22px;
    }

    .profile-header p{
        font-size:14px;
    }
    
}
</style>

</head>

<body>

<jsp:include page="includes/navbar.jsp" />

<div class="container">

<div class="profile-header">

    <div class="profile-avatar">
        <i class="fa-solid fa-user"></i>
    </div>

    <h2><%=user.getUsername()%></h2>

    <p><%=user.getEmail()%></p>

</div>

<form action="UpdateProfileServlet" method="post">

<input type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<label>Name</label>

<input
type="text"
name="name"
value="<%=user.getUsername()%>">

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>">

<label>Phone</label>

<input
type="text"
name="phone"
value="<%=user.getPhoneNumber()%>">

<label>Address</label>

<input
type="text"
name="address"
value="<%=user.getAddress()%>">

<button type="submit">
    <i class="fa-solid fa-floppy-disk"></i>
    Update Profile
</button>

</form>

</div>

</body>
</html>