<%--<%@ page import="static org.apache.coyote.http11.Constants.a" %>--%>

<%--<nav class="navbar navbar-expand-lg">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="index.jsp">E-Commerce Cart</a>--%>

<%--        <div class="collapse navbar-collapse" id="navbarScroll">--%>
<%--            <ul class="navbar-nav" style="--bs-scroll-height: 100px;">--%>
<%--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge" style="color:red;font-size: 18px">${ cartArrayList.size()}</span></a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="manage-user">Manage Account</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#">Manage Book</a></li>--%>
<%--                <% if(auth != null){ %>--%>
<%--                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>--%>
<%--                <%--%>
<%--                } else {--%>
<%--                %>--%>
<%--                    <li class="nav-item nav-item-end"><a class="nav-link" href="login.jsp">Login</a></li>--%>
<%--                <%--%>
<%--                }--%>
<%--                %>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="https://images.cooltext.com/5654904.png">
        </a>
        <div class="search-container">
            <form id="search">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" class="search-in" placeholder="Tìm kiếm">
                <button class="secrch-btn" type="submit">Tìm kiếm</button>
            </form>
        </div>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fas fa-home"></i>Home</a>
                </li>
                <li class="nav-item cart-icon" >
                    <a class="nav-link" href="cart.jsp">
                        <i class="fas fa-cart-plus"></i>
                        <span class="badge">${ cartArrayList.size()}</span>
                    </a>
                </li>
                <li class="nav-item"><a class="nav-link" href="manage-user">Manage Account</a></li>--%>
                <li class="nav-item"><a class="nav-link" href="#">Manage Book</a></li>
                <%
                        if(auth != null){
                    %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                <%
                    }else{
                        %>
                <li class="nav-item nav-item-end">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <%
                        }
                    %>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>

