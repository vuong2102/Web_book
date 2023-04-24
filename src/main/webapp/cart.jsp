<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cartArrayList != null){
        ProductDao productDao = new ProductDao(JDBCConnect.getConnection());
        cartProduct = productDao.getCartProducts(cartArrayList);
        double totalPrice = productDao.getTotalCartPrice(cartArrayList);
        request.setAttribute("cartArrayList", cartArrayList);
        request.setAttribute("totalPrice", totalPrice);
    }
%>
<html>
    <head>
        <title>Cart Page</title>
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/cart.css">
    </head>
    <body>
        <%@include file="includes/nav-bar.jsp"%>
        <div class="container">
            <div class="content-cart">
                <div class="nav-cart"><h2 class="">Total Price: $ ${(totalPrice>0)?dcf.format(totalPrice):0}</h2></div>
                <div class="nav-cart btn-checkout">
                    <a class="btn btn-primary" href="#">Check out</a>
                </div>
            </div>
            <div class="table-cart">
                <div>
                    <ul class="table-head">
                        <li class="table-col">Name</li>
                        <li class="table-col">Category</li>
                        <li class="table-col">Price</li>
                        <li class="table-col">Buy Now</li>
                        <li class="table-col">Action</li>
                    </ul>
                </div>
                <div class="list_items">
                    <% if(cartArrayList != null){
                        for(Cart c : cartProduct){ %>
                            <ul>
                                <li class="table-content"><%= c.getName()%></li>
                                <li class="table-content"><%= c.getCategory()%></li>
                                <li class="table-content"><%= c.getPrice()%></li>
                                <li class="table-content">
                                    <form action="" method="post" class="form-inline">
                                        <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                        <div class="form-group">
                                            <a href="" class="btn-incre"><i class="fas">+</i></a>
                                            <label>
                                                <input class="form-control" type="text" name="quantity" value="1" readonly>
                                            </label>
                                            <a href="" class="btn-decree"><i class="fas">-</i></a>
                                        </div>
                                    </form>
                                </li>
                                <li class="table-content"><a class="btn-remove" href="">Remove</a></li>
                            </ul>
                        <%}
                    }%>
                </div>
            </div>
        </div>
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>