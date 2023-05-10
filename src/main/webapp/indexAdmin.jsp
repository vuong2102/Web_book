<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
  User auth = (User) request.getSession().getAttribute("authAdmin");
  if(auth!= null){
    request.setAttribute("authAdmin", auth);
  }
  ProductDao pd = null;
  try {
    pd = new ProductDao(JDBCConnect.getConnection());
  } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
  }
  List<Product> products = pd.get8TopLoadProducts();

  List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
  if(cartArrayList != null){
    request.setAttribute("cartArrayList", cartArrayList);
  }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
</head>
    <body>
        <header>
            <%@include file="includes/navbar-admin.jsp"%>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="./product-images/img1.jpg" style="width:100%" alt="not remember">
                </div>
                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="./product-images/img2.jpg" style="width:100%" alt="not remember">
                </div>
                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="./product-images/img3.jpg" style="width:100%" alt="not remember">
                </div>
            </div>
            <div class="dots">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
            <script src="./JS/Showslider.js"></script>

            <div class="maxim">
                <h3>Chuyên bán sách giả sách lậu. Cam kết ko chính hãng. Mua là mất tiền</h3>
            </div>
        </header>
        <tbody>
            <div class="container">
                <div id="content-index" class="row">
                    <%
                        if (!products.isEmpty()) {
                            for (Product p : products) { %>
                        <div class="col-home">
                            <div class="card">
                                <img class="card-img-top" src="product-images/<%=p.getImage()%>"
                                     alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getName() %></h5>
                                    <h6 class="category">Thể loại: <%= p.getCategory()%></h6>
                                    <h4 class="price">$<%= p.getPrice()%></h4>
                                    <div class="container-btn">
                                        <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Thêm vào giỏ hàng</a>
                                        <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%}
                    }
                    %>
                </div>
            </div>
            <div class="load-more">
                <button class="btn" onclick="loadMore()">Load More</button>
            </div>
        </tbody>
        <footer>
            <%@include file="includes/footer.jsp"%>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
            function loadMore(){
                $.ajax({
                    url: "/Web_book_war_exploded/load-home",
                    success: function (data){
                        const row = document.getElementById("content-index");
                        row.innerHTML += data;
                    }
                });
            }
            function searchByName(param){
                const txtSearch = param.value;
                $.ajax({
                    url: "/Web_book_war_exploded/search",
                    type: "get",
                    data: {
                        txt: txtSearch
                    },
                    success: function (data){
                        const row = document.getElementById("content-index");
                        row.innerHTML = data;
                    }
                });
            }
        </script>
    </body>
</html>
