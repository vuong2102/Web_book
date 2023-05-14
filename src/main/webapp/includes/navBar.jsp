<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <div class="icon-menu" onclick="toggleMenu()">
      <button><i class="fas fa-bars"></i></button>
    </div>
    <a class="navbar-brand" href="index.jsp">
      <img style="width: 210px; height: 64px;" src="./product-images/logo.png">
    </a>
    <div class="search-container">
      <form id="search" action="search" method="get">
        <i class="fas fa-search"></i>
        <label for="searchInput"></label>
        <input oninput="searchByName(this)" type="text" name="txt" id="searchInput" class="search-in" placeholder="Tìm kiếm">
        <button class="search-btn" type="submit">Tìm kiếm</button>
      </form>
    </div>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.jsp"><i class="fas fa-home"></i>Trang chủ</a>
        </li>
        <li class="nav-item cart-icon" >
          <a class="nav-link" href="cart.jsp">
            <i class="fas fa-cart-plus"></i>
            <% if (cartArrayList != null && cartArrayList.size() > 0) { %>
            <span class="badge"><%= cartArrayList.size() %></span>
            <% } else { %>
            <span class="badge">0</span>
            <% } %>
          </a>
        </li>
        <%
          if(session.getAttribute("auth") != null){ %>
            <li class="nav-item"><a class="nav-link" href="orders.jsp">Đơn hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="detailAccount.jsp">Tài khoản</a></li>
            <li class="nav-item"><a class="nav-link" href="log-out">Đăng xuất</a></li>
        <%
        }else{
        %>
        <li class="nav-item nav-item-end">
          <a class="nav-link" href="login.jsp">Đăng nhập</a>
        </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
  <div class="nav-menu">
    <div class="res-search-container">
      <form id="res-search" action="search" method="get">
        <i class="fas fa-search"></i>
        <label for="searchInput"></label>
        <input oninput="searchByName(this)" type="text" name="txt" id="res-searchInput" class="search-in" placeholder="Tìm kiếm">
      </form>
    </div>
    <div class="collapse res-navbar-collapse">
      <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.jsp"><i class="fas fa-home"></i>Trang chủ</a>
        </li>
        <li class="nav-item cart-icon" >
          <a class="nav-link" href="cart.jsp">
            <i class="fas fa-cart-plus"></i>
            <% if (cartArrayList != null && cartArrayList.size() > 0) { %>
            <span class="badge"><%= cartArrayList.size() %></span>
            <% } else { %>
            <span class="badge">0</span>
            <% } %>
            Giỏ hàng
          </a>
        </li>
        <%
          if(session.getAttribute("auth") != null){ %>
        <li class="nav-item"><a class="nav-link" href="orders.jsp">Đơn hàng</a></li>
        <li class="nav-item"><a class="nav-link" href="detailAccount.jsp">Tài khoản</a></li>
        <li class="nav-item"><a class="nav-link" href="log-out"><i class="fas fa-user"></i>Đăng xuất</a></li>
        <%
        }else{
        %>
        <li class="nav-item nav-item-end">
          <a class="nav-link" href="login.jsp"><i class="fas fa-user"></i>Đăng nhập</a>
        </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>
