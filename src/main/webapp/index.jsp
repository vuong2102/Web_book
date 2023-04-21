<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
    ProductDao pd = new ProductDao(JDBCConnect.getConnection());
    List<Product> products = pd.getAllProducts();
%>


<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Shopping Book</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<%@include file="includes/nav-bar.jsp"%>

<div class="container">
    <h2 class="card-header">All Products</h2>
    <div class="row">
        <%
            if (!products.isEmpty()) {
                for (Product p : products) { %>
        <div class="col-home">
            <div class="card">
                <img class="card-img-top" src="product-images/<%=p.getImage()%>"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getName() %></h5>
                    <h6 class="price">Price: $<%= p.getPrice()%></h6>
                    <h6 class="category">Category: <%= p.getCategory()%></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a class="btn btn-dark" href="cart.jsp">Add to Cart</a>
                        <a class="btn btn-primary" href="">Buy Now</a>
                        <%--                                <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> --%>
                        <%--                                <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>--%>
                    </div>
                </div>
            </div>
        </div>
        <%}
        }
        else {
        }
        %>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>