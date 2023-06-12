<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
    ProductDao pd = null;
    try {
        pd = new ProductDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Product> products = null;
    products = pd.get8TopLoadProducts();

    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Shopping Book</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
    <body>
    <%@include file="includes/navBar.jsp"%>
            <%--    <%@include file="includes/nav-bar.jsp"%>--%>
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
        <div class="container">

            <form>
                <a>Lọc theo thể loại :</a>
                <label>
                    <select name="category" class="col">
                        <option>Tất cả</option>
                        <option>Science</option>
                        <option>Self-help</option>
                        <option>Bí kíp</option>
                        <option>Đố vui</option>
                        <option>Business</option>
                        <option>Model</option>
                        <option>Bí kíp</option>
                    </select>
                </label>
                <button type="submit" onclick="">Xac nhan loc</button>
            </form>
        </div>

        <tbody>
            <div class="container">
                <div id="content-index" class="row">
                    <%
                        if (!products.isEmpty()) {

                            for (Product p : products){

                                if(request.getParameter("category") == null || request.getParameter("category").equals("Tất cả") ){
                            %>
                            <div class="col-home" onclick = window.location="http://localhost:8080/Web_book_war_exploded/getSingleProduct?id=<%=p.getId()%>">
                                <div class="card">
                                    <img class="card-img-top" src="product-images/<%=p.getImage()%>"
                                         alt="Card image cap">
                                    <div class="card-information">
                                        <h5 class="card-title"><%= p.getName() %></h5>
                                        <h6 class="category">Thể loại: <%= p.getCategory()%></h6>
                                        <h4 class="price">$<%= p.getPrice()%></h4>
                                        <div class="container-btn">
                                            <a class="btn-dark" href="add-to-cart?id=<%=p.getId()%>">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%      } else if (p.getCategory().equals(request.getParameter("category"))) {
                            %>

                                    <div class="col-home" onclick = window.location="http://localhost:8080/Web_book_war_exploded/getSingleProduct?id=<%=p.getId()%>">
                                        <div class="card">
                                            <img class="card-img-top" src="product-images/<%=p.getImage()%>"
                                                 alt="Card image cap">
                                            <div class="card-information">
                                                <h5 class="card-title"><%= p.getName() %></h5>
                                                <h6 class="category">Thể loại: <%= p.getCategory()%></h6>
                                                <h4 class="price">$<%= p.getPrice()%></h4>
                                                <div class="container-btn">
                                                    <a class="btn-dark" href="add-to-cart?id=<%=p.getId()%>">Thêm vào giỏ hàng</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                    <%          }
                            }
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
