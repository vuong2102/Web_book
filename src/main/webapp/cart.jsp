<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>Cart Page</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
</head>
<body>
    <%@include file="includes/nav-bar.jsp"%>
    <div class="container">
        <div class="content-cart">
            <div class="nav-cart"><h2 class="">Total Price: $452</h2></div>
            <div class="nav-cart btn-checkout">
                <a class="btn btn-primary" href="#">Check out</a>
            </div>
        </div>   
        <div class="table-cart">
            <ul class="table-head">
                    <li class="table-col">Name</li>
                    <li class="table-col">Category</li>
                    <li class="table-col">Price</li>
                    <li class="table-col">Buy Now</li>
                    <li class="table-col">Action</li>
            </ul>
            <ul>
                <li class="table-content">Man Book</li>
                <li class="table-content">Book</li>
                <li class="table-content">$45</li>
                <li class="table-content">
                    <form action="" method="post" class="form-inline">
                        <input type="hidden" name="id" value="1" class="form-input">
                        <div class="form-group">
                            <a href="" class="btn-incre"><i class="fas">+</i></a>
                            <input class="form-control" type="text" name="quantity" value="1" readonly>
                            <a href="" class="btn-decree"><i class="fas">-</i></a>
                        </div>
                    </form>
                </li>
                <li class="table-content"><a class="btn-remove" href="">Remove</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
