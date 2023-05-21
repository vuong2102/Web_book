<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
    ProductDao pd = null;
    OrderDao od = null;
    try {
        pd = new ProductDao(JDBCConnect.getConnection());
        od = new OrderDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
    Product p1 = (Product) request.getAttribute("productDetail");
    int soSachDaBanCuaSanPham = od.demSoLuongSachDaBanCuaMotSanPham(p1.getId());
    request.setAttribute("productDetail", p1);
    assert auth != null;
    int soLuong = 1;
%>
<html>
<head>
    <title>Chi tiết sản phẩm</title>

    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/detail.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <%@include file="includes/navBar.jsp"%>
        <div class="container__detail">
            <div class="block__left">
                <img src="product-images/<%=p1.getImage()%>" alt="Sách">
            </div>
            <div class="block__right">
                <li class="list__item--detail"><%=p1.getName()%></li>
                <li class="list__item--detail">Thể loại: <%= p1.getCategory()%></li>
                <li class="list__item--detail">Giá: <%= p1.getPrice()%></li>
                <li class="list__item--detail">Đã bán: <%= soSachDaBanCuaSanPham%></li>
                <% if(auth != null) { %>
                    <li>Giao đến: <%= auth.getAddress()%></li>
                <%}%>
                <li class="des"><%= p1.getDescription()%></li>
                <div class="container-btn">
                    <a class="btn btn-primary" onclick="showAlert()" href="add-to-cart?id=<%=p1.getId()%>">Mua ngay</a>
                </div>

            </div>
        </div>
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
    <script>
        function showAlert(){
            alert("Sản phẩm đã được thêm vào giỏ hàng")
        }
    </script>
</body>
</html>
