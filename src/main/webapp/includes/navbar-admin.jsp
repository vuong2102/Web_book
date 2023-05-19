<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
      <img src="product-images/logo.png">
    </a>
        <div class="search-container">
            <form id="search">
                <i class="fas fa-search"></i>
                <label for="searchInput"></label><input type="text" id="searchInput" class="search-in" placeholder="Tìm kiếm">
                <button class="search-btn" type="submit">Tìm kiếm</button>
            </form>
        </div>
    </div>
    <div class="collapse navbar-collapse" id="navbarScroll">
        <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
            <li class="nav-item">
            <a class="nav-link" aria-current="page" href="indexAdmin.jsp"><i class="fas fa-home"></i>Trang chủ</a>
            </li>
            <%
                if(session.getAttribute("authAdmin") != null){ %>
                <li class="nav-item"><a class="nav-link" href="manage-user?index=1">Quản lý người dùng</a></li>
                <li class="nav-item"><a class="nav-link" href="manage-book?index=1">Quản lý sách</a></li>
                <li class="nav-item"><a class="nav-link" href="manage-order?index=1">Quản lý đặt hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a></li>
            <%
            }else{ %>
                <li class="nav-item nav-item-end">
                <a class="nav-link" href="login.jsp">Đăng nhập</a>
                </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
