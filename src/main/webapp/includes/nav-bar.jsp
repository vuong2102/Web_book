<%@ page contentType="text/html; charset=UTF-8" language="java" %>


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
               <%
                    if(session.getAttribute("auth") != null){ %>
                        <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                <%
                }else{
                %>
                <li class="nav-item nav-item-end">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>