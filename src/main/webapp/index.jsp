<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
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
            <div class="card-header">All Products</div>
            <div class="row">
<%--                <%--%>
<%--                if (!products.isEmpty()) {--%>
<%--                    for (Product p : products) {--%>
<%--                %>--%>
                <div class="col-md-3 my-3">
                    <div class="card">
<%--                        <img class="card-img-top" src="product-image/<%=p.getImage() %>"--%>
<%--                            alt="Card image cap">--%>
                        <img class="card-img-top" src="product-images/Khởi nghiệp phiêu lưu ký.jpg"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <h6 class="price">Price: $452</h6>
                            <h6 class="category">Category: some cate</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-dark" href="">Add to Cart</a>
                                <a class="btn btn-primary" href="">Buy Now</a>
<%--                                <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> --%>
<%--                                <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <%--%>
<%--                }--%>
<%--                } else {--%>
<%--                    out.println("There is no proucts");--%>
<%--                }--%>
<%--                %>--%>
    
            </div>
        </div>

        <%@include file="includes/footer.jsp"%>
    </body>
</html>