<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to Shopping Book</title>
        <%@include file="includes/head.jsp"%>
    </head>
    <body>
        <div class="container">
            <div class="card-header">
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar scroll</a>
                        <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button> -->
                        <div class="collapse navbar-collapse" id="navbarScroll">
                            <div class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                                <div class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="cart.jsp">Cart</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="orders.jsp">Order</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="orders.jsp">Logout</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="login.jsp">Login</a>
                                </div>
                            </div>
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
            <div>
                    
            </div>
        </div>
        <h1><%= "Shopping Book!" %></h1>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>