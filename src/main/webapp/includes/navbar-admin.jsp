<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="index.jsp">
      <img style="width: 210px;" src="./product-images/logo.png">
    </a>
    <div class="search-container">
      <form id="search">
        <i class="fas fa-search"></i>
        <label for="searchInput"></label><input type="text" id="searchInput" class="search-in" placeholder="Tìm kiếm">
        <button class="search-btn" type="submit">Tìm kiếm</button>
      </form>
    </div>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="indexAdmin.jsp"><i class="fas fa-home"></i>Trang chủ</a>
        </li>
        <%
          if(session.getAttribute("authAdmin") != null){ %>
          <li class="nav-item"><a class="nav-link" href="manage-user">Quản lý tài khoản</a></li>
          <li class="nav-item"><a class="nav-link" href="manage-book">Quản lý sách</a></li>
          <li class="nav-item"><a class="nav-link" href="manageOrder.jsp">Quản lý đặt hàng</a></li>
          <li class="nav-item"><a class="nav-link" href="log-out"><i class="fas fa-sign-out"></i>Đăng xuất</a></li>
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
